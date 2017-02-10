classdef Wire
    %Wire Class for wire info for CM inductor
    %   This class contains all the geometrical, electrical and magnetic
    %   information regarding the wire in CM indcutor design.
    %   Here only round wire is considered, rectangular or copper foil is not.
    %   
    %   Type:       single conductor or Litz wire
    %     - Single: conductor diameter, insulation thickness
    %     - Litz:   effective conducting area, total diameter
    %   Mechanical: geometry and density
    %   Electrical: conductivity or resistivity
    %   Magnetic:   relative permeability
    %   
    %   All units are in S.I. (Meters for length, seconds for time, etc.)
    
    properties
        % Type of wire: Single or Litz
        Type = 'Single';
                
        % Different types of wire requires different geometrical information.
        % Only effective conducting area and total diameter are public to other
        % class/functions, other properties are private.
        
        % Total diameter, in m
        DW   = 0.001;
        % Effective conducting area, in m^2
        Ae   = 6.36e-7;
        
        % The initializer is likely to take material as input. The wire 
        % conductivity and density is then set accordingly.
        
        % Material
        material = 'copper';
        % Conductivity, in S/m
        sig  = 58.5e6;
        % Density, in kg/m^3
        rho  = 8.96e3;
        
        % Relative permeability
        mu   = 1;
    end
        
    properties (Access = private)
        % Conductor diameter
        Dc   = 0.0009;
        % Insulation thickness
        Ti   = 0.0001;
    end
    
    methods
        function obj = Wire()
            % Initializer -- work with database group
        end

        function P   = CopperLoss(obj, Lw, I)
            % Calculate the copper loss in `Lw length wire and the current 
            % going through it is `I.
            % Only skin effect is considered at this point because
            % the CM inductor winding has a single layer structure.

        end

        function W   = Weight(obj, Lw)
            % Calculate the wire weight
            W = obj.rho * obj.Ae * Lw;
        end
    end
    
end