local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.ppid
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.command_line
      L1_1 = L1_1(L2_1)
      L2_1 = L0_1.ppid
      L4_1 = L1_1
      L3_1 = L1_1.match
      L5_1 = "\\conhost.exe"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        L3_1 = TrackPidAndTechniqueBM
        L4_1 = L2_1
        L5_1 = "T1202"
        L6_1 = "indirectcmdexec"
        L3_1(L4_1, L5_1, L6_1)
      end
      L3_1 = bm
      L3_1 = L3_1.get_process_relationships
      L3_1, L4_1 = L3_1()
      L5_1 = ipairs
      L6_1 = L4_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = TrackPidAndTechniqueBM
        L11_1 = L9_1.ppid
        L12_1 = "T1202"
        L13_1 = "indirectcmdexec"
        L10_1(L11_1, L12_1, L13_1)
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
