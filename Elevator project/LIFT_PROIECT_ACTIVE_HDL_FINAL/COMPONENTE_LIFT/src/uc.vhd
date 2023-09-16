library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity unitate_decizie is
	port(directie_de_mers:in std_logic;
	int_ext_sus_jos:in std_logic_vector(3 downto 0); --interior_exterior_sus_jos 
	y:out std_logic);
end entity;	


architecture arh1 of unitate_decizie is
begin
process(directie_de_mers,int_ext_sus_jos)

variable cont:std_logic:='0';
begin 
   if(int_ext_sus_jos="0000") then 
	   cont:='1'; 
   elsif(int_ext_sus_jos="1000" and directie_de_mers='0') then 
	   cont:='0'; 
   elsif(int_ext_sus_jos="1000" and directie_de_mers='1') then 
	   cont:='1'; 
   elsif(int_ext_sus_jos="0110" and directie_de_mers='0') then 
	   cont:='1'; 
   elsif(int_ext_sus_jos="0110" and directie_de_mers='1') then 
	   cont:='0'; 
   elsif(int_ext_sus_jos="0101" and directie_de_mers='0') then 
	   cont:='1'; 
   elsif(int_ext_sus_jos="0101" and directie_de_mers='1') then 
	   cont:='0'; 
   elsif(int_ext_sus_jos="1110" and directie_de_mers='0') then 
	   cont:='0'; 
   elsif(int_ext_sus_jos="1110" and directie_de_mers='1') then 
	   cont:='0';
	
else end if;
	
	y<=cont;
end process; 

end arh1;