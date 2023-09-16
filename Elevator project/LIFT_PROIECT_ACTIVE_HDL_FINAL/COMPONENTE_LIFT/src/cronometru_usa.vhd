library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity timer_usa is
	port(Reset,clk,okee:in std_logic;		-- okee=semnal_usa din Main_lift
	timp:out std_logic);	                -- outp=usi_iesire din Man_lift
end entity;

architecture arh1 of timer_usa is

signal semnal:std_logic:='0';
begin 
	
	process(Reset,clk,okee)
	
	variable vokee:std_logic;
	variable cont:std_logic_vector(3 downto 0);
	begin
		if(Reset='1') then 
			cont:="0000";
		end if;
		
		if(okee='1' and vokee='0') then 
			vokee:='1';
			semnal<='0';
			cont:="0000";
		end if;
		
		if(clk'event and clk='1' and vokee='1') then
			if(cont<"1010") then
				cont:=cont+"0001";
			else 
				semnal<='1';
				
				vokee:='0';
				cont:="0000";
end if;
end if;
timp<=not(semnal);
end process ;
end arh1;