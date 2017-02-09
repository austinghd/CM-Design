classdef Inductor
    %Inductor Class for CM inductor physical design
    %   Given wire, core, number of turns, type, determine the following:
    %     - whether the number of turns can fit into the core;
    %     - common mode inductance across a frequency range;
    %     - differential mode inductance depending on the mechanical structure;
    %     - winding capacitance (?)
    %     - power loss including both copper loss and core loss;
    %     - temperature rise using the power loss
    
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
            
        end
        
        function L   = DM(obj)
            % Calculate the differential mode inductance
            
        end
        
        function C   = Cp(obj)
            % Calculate the winding capacitance
            
        end
        
        function P   = Loss(obj, I)
            
        end
    end
    
end

