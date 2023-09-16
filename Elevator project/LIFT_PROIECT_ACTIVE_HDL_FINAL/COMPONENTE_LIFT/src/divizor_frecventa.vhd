library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity divf is
	port(clk:in std_logic;
	y:out std_logic);
end entity;

architecture arh1 of divf is

begin
	process(clk)
	variable v:std_logic_vector(25 downto 0):="00000000000000000000000000";
	begin
		
		if(clk'event and clk='1') then   --sau rising_edge(clk)
			v:=v+1;
		end if;
		y<=v(25);
	end process;
	end arh1;