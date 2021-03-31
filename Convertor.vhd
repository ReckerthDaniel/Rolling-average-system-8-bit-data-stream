library IEEE;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Convertor is
  port (
number: in std_logic_vector (3 downto 0);
Converted: out std_logic_vector (6 downto 0)
);
end Convertor;

architecture Convertor_architecture of Convertor is
begin
process (number)
variable LED_out: std_logic_vector(6 downto 0); 
begin
case number is
    when "0000" => LED_out := "0000001"; -- "0"     
    when "0001" => LED_out := "1001111"; -- "1" 
    when "0010" => LED_out := "0010010"; -- "2" 
    when "0011" => LED_out := "0000110"; -- "3" 
    when "0100" => LED_out := "1001100"; -- "4" 
    when "0101" => LED_out := "0100100"; -- "5" 
    when "0110" => LED_out := "0100000"; -- "6" 
    when "0111" => LED_out := "0001111"; -- "7" 
    when "1000" => LED_out := "0000000"; -- "8"     
    when "1001" => LED_out := "0000100"; -- "9" 
    when "1010" => LED_out := "0000010"; -- a
    when "1011" => LED_out := "1100000"; -- b
    when "1100" => LED_out := "0110001"; -- C
    when "1101" => LED_out := "1000010"; -- d
    when "1110" => LED_out := "0110000"; -- E
    when "1111" => LED_out := "0111000"; -- F
    when others => LED_out := "0000000";
end case;
Converted <= LED_out;
end process;
end Convertor_architecture;
