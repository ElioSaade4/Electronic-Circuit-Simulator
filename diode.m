% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a diode 
%             between nodes inplus and inminus.
%
%Input Parameters:  - inplus: anode
%                   - inminus: cathode
%                   - Is: saturation current
%                   - Vt: thermal voltage
% -------------------------------------------------------------------------

function diode(inplus,inminus,Is,Vt)

    global F n;
    
    %check for invalid nodes
    if (inplus < 0)||(inplus > n)||(inminus < 0)||(inminus > n)||(inplus == inminus)
        error('Invalid input node numbers.');
    %check for negative Is
    elseif Is < 0
        error('Invalid Is value. Make sure the value is positive.');
    %check for negative Vt
    elseif Vt < 0
        error('Invalid Vt value. Make sure the value is positive.');
    else
        %symbolic variables for voltages at inplus and inminus
        x1 = sym(strcat('V',string(inplus)));
        x2 = sym(strcat('V',string(inminus)));
        
        %diode equation
        f = Is*(exp((x1-x2)/Vt)-1);
    
        %add diode stamp to F
        if inplus ~= 0
            F(inplus) = F(inplus) + f;
        end
    
        if inminus ~= 0
            F(inminus) = F(inminus) - f;
        end
    end
end
    

