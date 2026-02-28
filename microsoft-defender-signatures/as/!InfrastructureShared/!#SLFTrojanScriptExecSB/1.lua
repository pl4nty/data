local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_AMSI_CONTENTNAME
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 and L2_1 ~= nil then
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = StringEndsWith
  L5_1 = L3_1
  L6_1 = ".vbs"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.IsMotwForFile
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetMotwZoneForFile
  L5_1 = L3_1
  L4_1, L5_1 = L4_1(L5_1)
  if L5_1 ~= nil and 3 <= L5_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
