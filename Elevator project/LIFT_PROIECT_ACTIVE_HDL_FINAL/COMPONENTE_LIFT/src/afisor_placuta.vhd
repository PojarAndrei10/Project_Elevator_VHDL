library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity afisor  is
	port(clk:in std_logic;
	Reset:in std_logic;
	a:in std_logic_vector(3 downto 0);		--intrarile a si b pt afisor
	b:in std_logic_vector(3 downto 0);
	anod:out std_logic_vector(3 downto 0);	 
	catod:out std_logic_vector(6 downto 0));
end entity;

architecture arh1 of afisor is

component multiplexor16_1 is
	port(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15:in std_logic_vector(3 downto 0);
	sel:in std_logic_vector(3 downto 0);
	Outt:out std_logic_vector(3 downto 0));
end component;	 

component registru is
	port(clk,Reset:in std_logic;
	iesire:out std_logic_vector(3 downto 0));
end component;

component decoderbcd7 is  
	port(a:in std_logic_vector(3 downto 0);
	outt:out std_logic_vector(6 downto 0));
end component;

component divf is
	port(clk:in std_logic;
	y:out std_logic);
end component;	  
 

signal y1:std_logic;
signal y2:std_logic_vector(3 downto 0);
signal y3:std_logic_vector(3 downto 0);

begin
	
	DIVIZOR_FRECVENTA:divf port map(clk,y1);
	DECODIFICATOR_BCD:decoderbcd7 port map(y2,catod);
	MUX16_LA_1:multiplexor16_1 port map("0000", "0000","0000","0000","0000","0000","0000","1111","0000","0000","0000","1111", "0000",b,a, "0000", y3, y2);
	INEL_CIRCULAR_REGISTRU:registru port map(clk,reset,y3);	 
	
	anod<=y3;--prin aceasta deplasare continua la stânga a bitului 0,pozitia zeroului din semnalul de 
	         --iesire va indica anodul care se va activa.
	end arh1;