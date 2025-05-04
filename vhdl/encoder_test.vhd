--
-- Entity: encoder_test 
-- Architecture : test 
-- Author: jkielty1
-- Created On: 10/22/2023
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_textio.ALL;
USE STD.textio.ALL;

ENTITY encoder_test IS

END encoder_test;

ARCHITECTURE test OF encoder_test IS

  COMPONENT encoder
    PORT (
      e : IN STD_LOGIC;
      a0 : IN STD_LOGIC;
      a1 : IN STD_LOGIC;
      y0 : OUT STD_LOGIC;
      y1 : OUT STD_LOGIC;
      y2 : OUT STD_LOGIC;
      y3 : OUT STD_LOGIC);
  END COMPONENT;

  FOR encoder_0 : encoder USE ENTITY work.encoder(structural);

  SIGNAL E : STD_LOGIC;
  SIGNAL A : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL clock : STD_LOGIC;

BEGIN

  encoder_0 : encoder PORT MAP(E, A(0), A(1), Y(0), Y(1), Y(2), Y(3));

  clk : PROCESS
  BEGIN -- process clk

    clock <= '0', '1' AFTER 5 ns;
    WAIT FOR 10 ns;

  END PROCESS clk;

  io_process : PROCESS

    FILE infile : text IS IN "encoder_in.txt";
    FILE outfile : text IS OUT "encoder_out.txt";

    VARIABLE e_v : STD_LOGIC;
    VARIABLE a_v : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE y_v : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
    VARIABLE buf : line;

  BEGIN

    WHILE NOT (endfile(infile)) LOOP
      readline(infile, buf);
      read (buf, e_v);
      E <= e_v;

      readline(infile, buf);
      read (buf, a_v);
      A <= a_v;

      WAIT UNTIL falling_edge(clock);

      y_v := Y;

      write(buf, y_v);
      writeline(outfile, buf);

    END LOOP;

  END PROCESS io_process;

END test;