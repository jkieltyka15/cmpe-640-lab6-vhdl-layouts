--
-- Entity: Dlatch_test 
-- Architecture : test 
-- Author: jkielty1
-- Created On: 10/22/2023
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_textio.ALL;
USE STD.textio.ALL;

ENTITY Dlatch_test IS

END Dlatch_test;

ARCHITECTURE test OF Dlatch_test IS

  COMPONENT Dlatch
    PORT (
      d : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      q : OUT STD_LOGIC;
      qbar : OUT STD_LOGIC);
  END COMPONENT;

  FOR Dlatch_0 : Dlatch USE ENTITY work.Dlatch(structural);

  SIGNAL D : STD_LOGIC;
  SIGNAL CLK0 : STD_LOGIC;
  SIGNAL Q : STD_LOGIC;
  SIGNAL QBAR : STD_LOGIC;
  SIGNAL clock : STD_LOGIC;

BEGIN

  Dlatch_0 : Dlatch PORT MAP(D, CLK0, Q, QBAR);

  clk : PROCESS
  BEGIN -- process clk

    clock <= '0', '1' AFTER 5 ns;
    WAIT FOR 10 ns;

  END PROCESS clk;

  io_process : PROCESS

    FILE infile : text IS IN "Dlatch_in.txt";
    FILE outfile : text IS OUT "Dlatch_out.txt";

    VARIABLE d_v : STD_LOGIC;
    VARIABLE clk0_v : STD_LOGIC;
    VARIABLE q_v : STD_LOGIC;
    VARIABLE qbar_v : STD_LOGIC;

    VARIABLE buf : line;

  BEGIN

    WHILE NOT (endfile(infile)) LOOP
      readline(infile, buf);
      read (buf, d_v);
      D <= d_v;

      readline(infile, buf);
      read (buf, clk0_v);
      CLK0 <= clk0_v;

      WAIT UNTIL falling_edge(clock);

      q_v := Q;

      write(buf, q_v);
      writeline(outfile, buf);

      qbar_v := QBAR;

      write(buf, qbar_v);
      writeline(outfile, buf);

    END LOOP;

  END PROCESS io_process;

END test;