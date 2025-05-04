--
-- Entity: and3
-- Architecture : structural
-- Author: jkielty1
-- Created On: 10/22/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and3 IS

  PORT (
    a : IN STD_LOGIC;
    b : IN STD_LOGIC;
    c : IN STD_LOGIC;
    output : OUT STD_LOGIC);
END and3;

ARCHITECTURE structural OF and3 IS

BEGIN

  output <= c AND b AND a;

END structural;