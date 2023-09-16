library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity num_1 is					--acest numarator numara in bucla 0-12 si cand ajunge la 12 coboara spre 0(parter) cu numaratul
	port(senzori:in std_logic;
	Reset,clk:in std_logic;
	et_atins:in std_logic_vector(3 downto 0);
	out_num:out std_logic_vector(3 downto 0);
	usi:out std_logic;
	sens:out std_logic);
end entity;
architecture arh1 of num_1 is
begin 
	
	process(Reset,clk,senzori)
	variable vsens:std_logic:='1';
	variable verif:std_logic_vector(3 downto 0):="0000";
	begin
		
		if(Reset='1') then 
			verif:="0000";
		end if;
		
		if(verif="0000") then 
			vsens:='1';
			sens<='1';
		end if;
		
		if(verif="1100") then 
			vsens:='0';
			sens<='0';
		end if;
		
		if(clk'event and clk='1' and senzori='0' and et_atins/=verif) then
			if(vsens='1') then
				verif:=verif+"0001";
			else 
				verif:=verif-"0001";
			end if;
			end if;
			out_num<=verif;	
			if(et_atins=verif) then	 --verif cand ajunge la etajul destinatie pentru a se deschide usile la acel etaj
				usi<='1';
			else usi<='0';
				end if;
		end process;
end arh1;