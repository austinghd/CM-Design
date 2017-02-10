classdef Inductor
    %Inductor Class for CM inductor physical design
    %   Given wire, core, number of turns, type, determine the following:
    %     - whether the number of turns can fit into the core;
    %     - common mode inductance across a frequency range;
    %     - differential mode inductance depending on the mechanical structure;
    %     - winding capacitance
    %     - power loss including both copper loss and core loss;
    %     - temperature rise using the power loss
    %
    %   `theta - the winding spanning angle on the core is also a design
    %   parameter and in the code, it can be either optimized to minimize 
    %   winding copper loss (minimal length) or optimized to minimize winding
    %   capacitance (larget turn gap).
    %
    %   All units are in S.I. (Meter for length, second for time, etc.)
    
    properties
        % Wire
        wire;
        % Core
        core;
        % Actual number of turns
        N;
        
        % Maximum number of turns
        Nm;
        % Winding filling tolerance
        tolN = 0.1;
        
        % Wire length
        Lw;
        % Total wire length tolerance
        tolL = 0.1;
        
        % CM inductance
        lcm;
        % DM inductance
        ldm;
        % Winding capacitance
        cp;
    end
    
    methods
        function obj = Inductor(wire, core, N, Nwind)
            % Construct an `Nwind windings inductor with 
            % `N turns of `wire and `core
            obj.wire = wire;
            obj.core = core;
            obj.N    = N;
            
            alpha  = 2 * asin( wire.DW / (core.ID - wire.DW) );
            obj.Nm = floor(2 * pi / alpha / Nwind);
            if obj.N <= obj.Nm * (1 - tolN)
                
            else
                % The `N turns of wire can not fit into the core.
                obj.Lw  = 0;
                obj.lcm = 0;
                obj.ldm = 0;
                obj.cp  = 0;
            end
        end
        
        function L   = CM(obj)
            % Calculate the common mode inductance
           mu0 = 4 * pi * 1e-7;
           L   = obj.core.mu * mu0 * obj.N^2 * obj.core.Ae / obj.core.Le; 
        end
        
        function L   = DM(obj, theta)
            % Calculate the differential mode inductance
            % theta is the angle winding spanning across the core
            % Effective differential mode flux path length
            mu0  = 4 * pi * 1e-7;
            Leff = sqrt( obj.core.OD^2 / sqrt(2) * ...
            (theta / 4 + 1 +  sin(theta / 2)) .^2 + ...
            obj.core.ID^2 * (theta / 4 - 1 + sin(theta / 2)) .^2 );
            muDM = 2.5 * ( sqrt(pi / obj.core.Ae) * obj.core.Le / 2 )^1.45;
            L    = muDM * mu0 * obj.N^2 * obj.core.Ae / Leff;
        end

        function Lw  = Length(obj, theta)
            % Calculate the wire length
            Lw = obj.N * sqrt( (obj.OD - obj.ID + 2 * obj.HT)^2 + ...
            (theta * (ID + OD) / 4 / obj.N)^2 );
        end
        
        function C   = Cp(obj)
            % Calculate the winding capacitance
            
        end
        
        function P   = Loss(obj, I)
            % Combine the inductor copper loss and core loss
            P = obj.core.Loss(I) + obj.wire.Loss(obj.Lw, I);
        end
    end
    
end