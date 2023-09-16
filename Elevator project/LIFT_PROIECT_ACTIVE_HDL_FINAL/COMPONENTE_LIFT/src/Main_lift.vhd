library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_ARITH.ALL;

entity lift is
	port(cerere_lift:in std_logic_vector(3 downto 0);
	ie_sj: in std_logic_vector(3 downto 0);
	oke:in std_logic;
	Reset:in std_logic;
	clk:in std_logic; 
	senzori:in std_logic; 
	viteza_intrare:in std_logic;
	anod:out std_logic_vector (3 downto 0);
	catod:out std_logic_vector(6 downto 0);	 
	usi_deschise,sens,senzori_iesire,viteza_iesire:out std_logic);
end entity;	

architecture arh1 of lift is

component unitate_decizie is
	port(directie_de_mers:in std_logic;
	int_ext_sus_jos:in std_logic_vector(3 downto 0); --interior_exterior_sus_jos 
	y:out std_logic);
end component;		

component multiplexor2_1 is
	port(a,b:in std_logic;
	sel:in std_logic;
	out_mux:out std_logic);
end component;

--entity NUM_2 is		--fiecare valoarea a numaratorului variable fi afisata pe afisorul cu 7 segmente
	--port(clk:in std_logic;
	--iesire_num_clasic:in std_logic_vector(3 downto 0);  --de la numarator1
	--Reset,directie,clk2:in std_logic;
	--y:out std_logic;
	--k:out std_logic_vector(3 downto 0));
--end entity;

component poarta_not is
	port(a:in std_logic;
	b:out std_logic);
end component;	  

component mem_ram is
	port(a1:in std_logic_vector(3 downto 0);
	a2:in std_logic_vector(3 downto 0);
	we:in std_logic;
	Reset:in std_logic;
	dd:in std_logic_vector(3 downto 0);
	out_ram:out std_logic_vector(3 downto 0));
end component;

component poarta_si is
	port(a,b,c:in std_logic;
	y:out std_logic);
end component;


component decoderbcd7 is  
	port(bcd:in std_logic_vector(3 downto 0);
	outt:out std_logic_vector(6 downto 0));
end component;

component timer_usa is
	port(Reset,clk:in std_logic;
	okee:in std_logic;
	timp:out std_logic);
end component; 

component registru is
	port(clk,Reset:in std_logic;
	Y:out std_logic_vector(3 downto 0));
end component;

	

component multiplexor16_1 is
	port(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15:in std_logic_vector(3 downto 0);
	sel:in std_logic_vector(3 downto 0);
	Outt:out std_logic_vector(3 downto 0));
end component;	 

component afisor  is
	port(clk:in std_logic;
	Reset:in std_logic;
	a:in std_logic_vector(3 downto 0);		--intrarile r1 si r2 pt afisor
	b:in std_logic_vector(3 downto 0);
	anod:out std_logic_vector(3 downto 0);	 
	catod:out std_logic_vector(6 downto 0));
end component;


component divf is
	port(clk:in std_logic;
	y:out std_logic);
end component;

component NUM is
	port(secunde:in std_logic_vector(3 downto 0);
	reset:in std_logic;
	clk,en:in std_logic;
	ies_clk:out std_logic;
	outt:out std_logic_vector(3 downto 0));
end component;

component num_1 is					--acest numarator numara in bucla 0-12 si cand ajunge la 12 coboara spre 0(parter) cu numaratul
	port(senzori:in std_logic;
	Reset,clk:in std_logic;
	et_atins:in std_logic_vector(3 downto 0);
	out_num:out std_logic_vector(3 downto 0);
	usi:out std_logic;
	sens:out std_logic);
end component;

--TOATE SEMNALELE NECESARE DIN MAIN
signal iesire_ie_sj:std_logic_vector(3 downto 0);   --iesire memorie RAM
signal sus:std_logic;  --iesire din numaratorul clasic de parcurgere a etajelor 
signal clk_num:std_logic; --iesirea unitatii de control
signal semnal_usa:std_logic;  --intrare in timer si iesire de la numarator (se variable folosi la determinarea iesirii usi_deschise a liftului)
signal usi_iesire:std_logic:='0'; --iesire timer
signal iesire_numarator:std_logic_vector(3 downto 0); --iesirea numaratorului clasic
signal clk_num1:std_logic;  --intrare in poarta not
signal clk_num2:std_logic; 	--iesire poarta not,intrare in nr de viteza pe post de clk
--Cand numaratorul de viteza isi atinge limita maxima el va activa un semnal care va intra într-un Mux 2 la 1 ca intrare
signal intrare_in_mux:std_logic;  --iesire num viteza 1,intrare in mux 2:1
signal intrare_in_mux2:std_logic; --iesire num viteza 2,intrare in mux 2:1
signal iesire1:std_logic_vector(3 downto 0); --iesire num viteza 1
signal iesire3:std_logic_vector(3 downto 0); --iesire num viteza 2
signal mux_zeci:std_logic_vector(3 downto 0);    --multiplexorul pe care va iesi cifra zecilor redata în functie de aceeasi selectie primita si multiplexorul unitatilor(0000 sau 0001)
signal mux_unitati:std_logic_vector(3 downto 0); --multiplexorul pe care va iesi cifra unitatilor redata în functie de bitii de selectie( intre 0000 si 1001 
signal clk2:std_logic;	 --iesirea portii and
signal v_selectata:std_logic; --iesirea multiplexorului 2:1 care va folosi ca selectie pe viteza_intrare(care e o intrare a liftului) si astfel vor iesi impulsuri de clock în functie de viteza selectata
signal ies2:std_logic_vector (3 downto 0); 	--selectia multiplexoarelor care se ocupa de cifra unitatilor si de cifra zecilor(pentru afisor)

begin
	viteza_iesire<=viteza_intrare;  --1 sau 3 secunde/etaj
	Stocare_cereri_etaj:mem_ram port map(cerere_lift,iesire_numarator,Reset,oke,ie_sj,iesire_ie_sj);  
	Verificare:unitate_decizie port map(sus,iesire_ie_sj,clk_num); 	 
	Timp_usa_deschisa:timer_usa port map(Reset,clk,semnal_usa,usi_iesire);  
	Numarare:num_1 port map(senzori,Reset, clk,cerere_lift,iesire_numarator,semnal_usa,sus);                                                                      
	Inversor:poarta_not port map(clk_num1, clk_num2);
	sens <= sus;	
	senzori_iesire<=senzori;
	Numarare_viteza:NUM port map ("0011", clk,clk_num2, Reset, intrare_in_mux, iesire1);
	Numarare_viteza2:NUM port map ("0111",clk, clk_num2, Reset, intrare_in_mux2,iesire3);
	Viteza_selectata:multiplexor2_1 port map (intrare_in_mux, intrare_in_mux2, viteza_intrare, v_selectata); 
	Si: poarta_si port map(clk, v_selectata, '1', clk2);
	usi_deschise<=semnal_usa or senzori;
    Mux:multiplexor16_1 port map("0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "0000", 
	"0001", "0010", "1111", "1111", "1111", ies2,mux_unitati);
    Mux2:multiplexor16_1 port map("0000","0000","0000","0000","0000","0000","0000","0000","0000","0000", "0001", "0001", 
	"0001", "1111", "1111", "1111",ies2, mux_zeci);  
	Afisor_placuta:afisor port map(clk,Reset,mux_zeci,mux_unitati,anod,catod);
	
end arh1; 

