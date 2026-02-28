local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L0_1["360.cn"] = true
L1_1 = {}
L1_1["ramengine.dll"] = true
L2_1 = pe
L2_1 = L2_1.get_versioninfo
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.CompanyName
L4_1 = L2_1.OriginalFilename
if L3_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L3_1 = L5_1
else
  L3_1 = ""
end
if L4_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
else
  L4_1 = ""
end
L5_1 = L0_1[L3_1]
if L5_1 then
  L5_1 = L1_1[L4_1]
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "LUA:360CnRansomwareTool"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
