library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity average is
	port (
	CLK: in std_logic;
	RST: in std_logic;
	Length: in std_logic_vector (2 downto 0);
	Control: in std_logic_vector (2 downto 0);
	ANOD: out std_logic_vector (7 downto 0);
	CATOD: out std_logic_vector (6 downto 0)
	);
end average;

architecture average_architecture of average is
component DataGenerator is
	port (
	CLK, RST: in std_logic;
	Control: in std_logic_vector (2 downto 0);
	Data1: out std_logic_vector (7 downto 0)
	);
end component;

component frequency_divider is
	port( 
	CLK: in std_logic;
	CLK_OUT: out std_logic
	);
end component ;



component average_computer is 
	port (
		number: IN std_logic_vector (7 downto 0);
		reset: IN std_logic;
		data_clk: IN std_logic;
		length: IN std_logic_vector (2 downto 0);
		average: OUT std_logic_vector (7 downto 0)
	);
end component ;

component DISPLAY is
	port(CLK: in std_logic;
	number: in std_logic_vector (7 downto 0);
	average: in std_logic_vector (7 downto 0);
	ANOD: out std_logic_vector(3 downto 0);
	CATOD: out std_logic_vector(6 downto 0));
end component;

signal Data_internal: std_logic_vector (7 downto 0);
signal DATA_CLK: std_logic;
signal display_internal: std_logic_vector (7 downto 0);
signal average_internal: std_logic_vector (7 downto 0);
begin
	DG: DataGenerator port map(CLK, RST, Control, Data_internal);
	FDiv: frequency_divider port map(CLK, DATA_CLK);	
	AC: average_computer port map(Data_internal, RST, DATA_CLK, length, average_internal);
	Displayer: DISPLAY port map(CLK, Data_internal, average_internal, ANOD(3 downto 0), CATOD);
	ANOD(7 downto 4) <= "1111";
	
end average_architecture;