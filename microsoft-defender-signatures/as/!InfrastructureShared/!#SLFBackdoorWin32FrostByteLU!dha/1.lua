local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 5184000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\temp"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
if 2 < L2_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = pe
L4_1 = L4_1.get_versioninfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = L4_1.CompanyName
  if L5_1 ~= "TODO" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = L4_1.OriginalFilename
  if L5_1 ~= "COM.dll" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
