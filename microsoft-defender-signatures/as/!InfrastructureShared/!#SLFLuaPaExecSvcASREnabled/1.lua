local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = 0
L5_1 = 4
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "\\\\?\\" then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = 5
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
end
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = 1
L5_1 = 8
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "\\device\\" then
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "^c:\\windows\\[^\\]+%.exe$"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsHipsRuleEnabled
L3_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
L2_1 = L2_1(L3_1)
if L2_1 ~= true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
