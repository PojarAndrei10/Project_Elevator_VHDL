library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity multiplexor2_1 is
	port(a,b:in std_logic;
	sel:in std_logic;
	out_mux:out std_logic);
end entity;

architecture arh1 of multiplexor2_1 is
begin
	process(a,b,sel)
	begin
		case (sel) is
			when '0'=>out_mux<=a;
			when others=>out_mux<=b;
		end case;
	end process;
	end arh1;