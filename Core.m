classdef Core
    %Core Class for CM inductor toroidal core with rectangular cross-section.
    %   This class contains the geometrical and magnetic information regarding
    %   the toroidal core in CM inductor design.
    %
    %   Geometrical:
    %     ID - Inner diameter
    %     OD - Outer diameter
    %     HT - Heigth
    %     Ae - Effective cross-sectional area
    %     Le - Effective flux path inside core
    %     V  - Volume: effective enclosing volume
    %     W  - Weight
    %   Magnetic: relative permeability v.s. frequency, saturation field density
    %   Loss information: (Work with database group)
    %     Method - loss calculation methods differ for different manufacturer.
    %     Parameters - 
    %   Cost: unit price in $
    %
    %   All units are in S.I. (Meters for length, seconds for time, etc.)
    
    properties
        % Inner diameter
        ID;
        % Outer diameter
        OD;
        % Height
        HT;
        % Core effective cross sectional area
        Ae;
        % Core flux path effective length
        Le;
        % Volume
        V;
        % Weight
        W; 
        % Relative permeability v.s. frequency
        mu;
        % Saturation B field density
        Bsat;
        % Loss information
        
        % Unit price
        Pu;
    end
    
    methods
        function obj = Core()
            % Initializer -- work with database group.
        end
        
        function P   = Loss(obj)
            % Actual loss calculation method differs for different core.
        end
    end
    
end