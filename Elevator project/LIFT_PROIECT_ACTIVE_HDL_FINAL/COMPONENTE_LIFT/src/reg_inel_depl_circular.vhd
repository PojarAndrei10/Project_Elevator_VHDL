library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity registru is
	port(clk,Reset:in std_logic;
	iesire:out std_logic_vector(3 downto 0));
end entity;	

architecture arh1 of registru is  

signal semnall_registru_inel:std_logic_vector(3 downto 0);
begin
	process(clk)
	
	variable v:integer:=0;
	begin
		if(clk'event and clk='1') then

			if(Reset='1') then semnall_registru_inel<="1111";
				v:=0;
		elsif(v=4) then v:=0;
		end if;
		
		semnall_registru_inel<="1111";
		semnall_registru_inel(v)<='0'; 
		v:=v+1;
		end if;	 
		iesire<=semnall_registru_inel;
		end process;
		end arh1;
		