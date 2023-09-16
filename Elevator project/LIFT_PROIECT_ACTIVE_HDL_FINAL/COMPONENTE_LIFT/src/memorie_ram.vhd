library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity mem_ram is
	port(a1:in std_logic_vector(3 downto 0);
	a2:in std_logic_vector(3 downto 0);
	we:in std_logic;
	Reset:in std_logic;
	dd:in std_logic_vector(3 downto 0);
	out_ram:out std_logic_vector(3 downto 0));
end entity;

architecture arh1 of mem_ram is

type Memorie is array(0 to 15) of std_logic_vector(3 downto 0);
signal m:Memorie;
begin
process(a1,a2,we,Reset,dd)
begin
	if(Reset='1') then
	m(0)<="0000";
	m(1)<="0000";
	m(2)<="0000";
	m(3)<="0000";
	m(4)<="0000";
	m(5)<="0000";
	m(6)<="0000";
	m(7)<="0000";
	m(8)<="0000";
	m(9)<="0000";
	m(10)<="0000";
	m(11)<="0000";
	m(12)<="0000";
	m(13)<="0000";
	m(14)<="0000";
	m(15)<="0000";	
else   
	if(we='1') then 
		case (a1) is
	when "0000" => m(0)<=dd;
	when "0001" => m(1)<=dd;
	when "0010" => m(2)<=dd;
	when "0011" => m(3)<=dd; 
	when "0100" => m(4)<=dd;
	when "0101" => m(5)<=dd; 
	when "0110" => m(6)<=dd; 
	when "0111" => m(7)<=dd;
	when "1000" => m(8)<=dd;
	when "1001" => m(9)<=dd;
	when "1010" => m(10)<=dd;
	when "1011" => m(11)<=dd; 
	when "1100" => m(12)<=dd;
	when others => m(15)<="0000";
	end case;
else 
	case (a2) is
    when "0000" => out_ram<=m(0);
	when "0001" => out_ram<=m(1);
	when "0010" => out_ram<=m(2);
	when "0011" => out_ram<=m(3); 
	when "0100" => out_ram<=m(4);
	when "0101" => out_ram<=m(5); 
	when "0110" => out_ram<=m(6); 
	when "0111" => out_ram<=m(7);
	when "1000" => out_ram<=m(8);
	when "1001" => out_ram<=m(9);
	when "1010" => out_ram<=m(10);
	when "1011" => out_ram<=m(11); 
	when "1100" => out_ram<=m(12);
	when others => out_ram<="0000";
    end case;	

end if;
end if;
end process;
end arh1;