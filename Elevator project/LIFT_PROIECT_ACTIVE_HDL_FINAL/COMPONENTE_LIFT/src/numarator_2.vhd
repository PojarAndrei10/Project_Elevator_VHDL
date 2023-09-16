library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity NUM_2 is		--fiecare valoarea a numaratorului variable fi afisata pe afisorul cu 7 segmente
	port(clk:in std_logic;
	iesire_num_clasic:in std_logic_vector(3 downto 0);  --de la numarator1
	Reset,directie,clk2:in std_logic;
	y:out std_logic;
	k:out std_logic_vector(3 downto 0));
end entity;

architecture arh1 of NUM_2 is
begin
	process(directie,Reset,clk,iesire_num_clasic)
	variable verif:std_logic_vector(3 downto 0):="0000";
	
	--verif:="0000";
	begin
		if(Reset='1') then verif:="0000";
		y<='1';
		end if;
		if(clk'event and clk='1' and clk2 ='1') 
			then y<='0';
			--verificam directia de mers
		if(directie='1') then 
			if (verif<iesire_num_clasic) then 
					verif:=verif+"0001";  
			else 
				y<='1';
			end if;
		else if(verif>iesire_num_clasic) 
				then verif:=verif-"0001";
		else 
			y<='1';
				end if;
				end if;
				end if;
				k<=verif;
			end process;
			
end arh1;