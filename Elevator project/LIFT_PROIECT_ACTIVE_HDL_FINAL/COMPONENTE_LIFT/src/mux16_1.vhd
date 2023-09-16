library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity multiplexor16_1 is
	port(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15:in std_logic_vector(3 downto 0);
	sel:in std_logic_vector(3 downto 0);
	Outt:out std_logic_vector(3 downto 0));
end entity;	 

architecture arh1 of multiplexor16_1 is

begin
	process(sel,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15)
	begin	  
		case (sel) is
			when "0000" =>Outt<=a0;
			when "0001" =>Outt<=a1;
			when "0010" =>Outt<=a2;
			when "0011" =>Outt<=a3; 
			when "0100" =>Outt<=a4;
			when "0101" =>Outt<=a5; 
			when "0110" =>Outt<=a6; 
			when "0111" =>Outt<=a7;
			when "1000" =>Outt<=a8;
			when "1001" =>Outt<=a9;
			when "1010" =>Outt<=a10;
			when "1011" =>Outt<=a11; 
			when "1100" =>Outt<=a12;
			when "1101" =>Outt<=a13;
			when "1110" =>Outt<=a14;
			when others =>Outt<=a15;
		end case;
	end process;
	end arh1;