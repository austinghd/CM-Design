classdef Core
    %Core Class for CM inductor toroidal core with rectangular cross-section.
    %   This class contains the geometrical and magnetic information regarding
    %   the toroidal core in CM inductor design.
    %
    %   Geometrical:
    %     ID - Inner diameter
    %     OD - Outer diameter
    %     HT - Heigth
    %     V  - Volume
    %   Magnetic: relative permeability v.s. frequency
    %   Loss information: (Work with database group)
    %     Method - loss calculation methods differ for different manufacturer.
    %     Parameters - 
    %
    %   All units are in S.I. (Meters for length, seconds for time, etc.)
    
    properties
        % Inner diameter
        ID;
        % Outer diameter
        OD;
        % Height
        HT;
        % Volume
        V;
        
        % Relative permeability
        mu;
        % Loss information
        
    end
    
    methods
        function obj = Core()
            % Initializer -- work with database group.
        end
        
        
        function Rth = ThermalResistance(obj)
            % Estimate thermal resistance based on geometrical information.
        end
        
        function P   = CoreLoss(obj)
            % Actual loss calculation method differs for different core.
        end
    end
    
end

