local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "assemblypath%s+%$(%w+)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = L2_1
  L4_1 = "%s*=%s*(.-%.dll['\\\"]?)"
  L3_1 = L3_1 .. L4_1
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L1_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L5_1 = TrackPidAndTechnique
    L6_1 = "RTP"
    L7_1 = "T1071.003"
    L8_1 = "tactic=registers_susptransportdll;filepath:"
    L9_1 = L4_1
    L8_1 = L8_1 .. L9_1
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = AppendToRollingQueue
    L6_1 = "XchgTransportAssembly"
    L7_1 = L4_1
    L8_1 = nil
    L9_1 = 3600
    L5_1(L6_1, L7_1, L8_1, L9_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
