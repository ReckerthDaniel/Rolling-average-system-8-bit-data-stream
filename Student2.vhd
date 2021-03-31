library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Student2 is
	port( CLK: in std_logic;
	RST: in std_logic;
	OP: out std_logic_vector (7 downto 0));
end Student2;

architecture A_Student2 of Student2 is

begin
	
	process(CLK, RST)
	type StudentMem is array (5 downto 0) of std_logic_vector (7 downto 0);
	variable student2: StudentMem := ("00000101", "00001000", "00000111", "00000100", "00000101", "00000011"); -- numbers: 5 8 7 4 5 3
	variable temp: std_logic_vector (7 downto 0);
	begin
		
			
		if (rising_edge(CLK)) then
			if (RST = '1') then
			  OP <= "00000000";
			end if;
			
			temp := student2(5);
			student2(5 downto 1) := student2(4 downto 0);
			student2(0) := temp;
			
		end if;
		OP <= temp;
	end process;
end A_Student2;