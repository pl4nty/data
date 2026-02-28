local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:TrojanSpy:Win32/Ranbyus!obf"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "HSTR:Worm:Win32/Rebhip!encrsrc"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "HSTR:VirTool:Win32/VBInject.ADR"
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "HSTR:VirTool:Win32/VBInject.ADS"
L3_1 = L3_1(L4_1)
if L0_1 or L1_1 or L2_1 or L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
