library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity poarta_not is
	port(a:in std_logic;
	b:out std_logic);
end entity;

architecture arh1 of poarta_not is
begin
	
	b<=not(a);
end arh1;