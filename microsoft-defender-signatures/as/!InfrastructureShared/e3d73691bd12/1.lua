local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpCmdLineFoundB64"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = set_research_data
  L2_1 = "ParentProcess"
  L3_1 = string
  L3_1 = L3_1.gsub
  L4_1 = L0_1.ppid
  L5_1 = ","
  L6_1 = ":"
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L4_1 = ";"
  L5_1 = L0_1.image_path
  L3_1 = L3_1 .. L4_1 .. L5_1
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
