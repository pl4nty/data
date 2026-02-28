local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 5242880 < L0_1 or L0_1 < 3072 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "CppcDxe"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "CMN:HSTR:UefiUtils"
L2_1 = L2_1(L3_1)
L3_1 = false
L4_1 = #L2_1
if 0 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tostring
L5_1 = pesecs
L6_1 = pevars
L6_1 = L6_1.epsec
L5_1 = L5_1[L6_1]
L5_1 = L5_1.Name
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L4_1 ~= ".text" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:UefiFwAnomEntry"
  L5_1(L6_1)
  L3_1 = true
end
if L3_1 == true then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
