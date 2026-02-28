local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = GetAppomalyProcessAttribute
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 then
      goto lbl_17
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = 1
L3_1 = -1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = sigattr_tail
  L5_1 = L5_1[L4_1]
  L6_1 = L5_1.matched
  if L6_1 then
    L6_1 = L5_1.attribute
    if L6_1 == 16400 then
      L6_1 = L5_1.utf8p1
      if L6_1 then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1.utf8p1
        L6_1 = L6_1(L7_1)
        L7_1 = "(ipconfig|curl|ping|wget|bitsadmin|certutil|schtasks|mshta|rundll32|regsvr32|msbuild|installutil|msiexec|sqltoolsps)"
        L8_1 = MpCommon
        L8_1 = L8_1.StringRegExpSearch
        L9_1 = L7_1
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L9_1 = CommandLineGrader
          L10_1 = L5_1.utf8p2
          L11_1 = false
          L9_1, L10_1 = L9_1(L10_1, L11_1)
          if not L10_1 or L9_1 < 5 then
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            return L11_1
          end
          L11_1 = AppendToRollingQueue
          L12_1 = "PFApp_Pid_LolBinsWin"
          L13_1 = L0_1.ppid
          L14_1 = L5_1.utf8p1
          L15_1 = L5_1.utf8p2
          L14_1 = L14_1 .. L15_1
          L15_1 = 1800
          L16_1 = 100
          L17_1 = 0
          L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
