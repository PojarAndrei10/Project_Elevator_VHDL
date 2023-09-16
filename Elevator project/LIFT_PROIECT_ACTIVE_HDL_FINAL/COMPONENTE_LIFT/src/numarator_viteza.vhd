library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity NUM is
	port(secunde:in std_logic_vector(3 downto 0);
	reset:in std_logic;
	clk,en:in std_logic;
	ies_clk:out std_logic;
	outt:out std_logic_vector(3 downto 0));
end entity;

architecture arh1 of NUM is
begin 	  
--variable calcul:std_logic_vector(3 downto 0);
process(clk,en,reset,secunde)

variable CALCUL:std_logic_vector(3 downto 0);
begin 	 
	ies_clk<='0';
	if(reset='1') then 
		CALCUL:="0000";
	end if;	
	
	if(clk'event and clk='1' and en='1') then 
		if(calcul/=secunde) then
			CALCUL:=CALCUL+"0001";
		else calcul:="0000";
			ies_clk<='1';
		end if;
		end if;
		outt<=CALCUL;
		
	end process;
end arh1;
	