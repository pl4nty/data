local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = ""
L2_1 = L0_1.is_header
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = headerpage
  L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "assemblypath%s*(['\"]?%a:.+%.dll['\"]?)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = TrackPidAndTechnique
  L4_1 = "RTP"
  L5_1 = "T1071.003"
  L6_1 = "tactic=registers_susptransportdll;filepath:"
  L7_1 = L2_1
  L6_1 = L6_1 .. L7_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = AppendToRollingQueue
  L4_1 = "XchgTransportAssembly"
  L5_1 = L2_1
  L6_1 = nil
  L7_1 = 3600
  L3_1(L4_1, L5_1, L6_1, L7_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
