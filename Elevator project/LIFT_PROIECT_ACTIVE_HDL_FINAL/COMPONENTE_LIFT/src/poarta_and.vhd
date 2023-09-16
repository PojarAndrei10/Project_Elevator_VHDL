library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity poarta_si is
	port(a,b,c:in std_logic;
	y:out std_logic);
end entity;

architecture arh1 of poarta_si is
begin 
	
	y<=a and b and c;
end arh1;