library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity decoderbcd7 is  --7 segments
	port(a:in std_logic_vector(3 downto 0);
	outt:out std_logic_vector(6 downto 0));
end entity;

architecture arh1 of decoderbcd7 is
begin
	process(a)
	begin
		case (a) is	
			
			when "0000"=>outt<="0000001";
			when "0001"=>outt<="1111001";
			when "0010"=>outt<="0010010";
			when "0011"=>outt<="0000110";
			when "0100"=>outt<="1000100";
			when "0101"=>outt<="0100100";
			when "0110"=>outt<="1100000";
			when "0111"=>outt<="0001111";
			when "1000"=>outt<="0000000";
			when "1001"=>outt<="0000100";
			when others=>outt<="1111111";
		end case;
	end process;
	
	end arh1;