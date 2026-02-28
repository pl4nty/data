local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = {}
L0_1.TimeProvOpen = ""
L0_1.TimeProvClose = ""
L0_1.TimeProvCommand = ""
L1_1 = 0
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
if 2 < L2_1 then
  L4_1 = 1
  L5_1 = L2_1
  L6_1 = 1
  for L7_1 = L4_1, L5_1, L6_1 do
    L8_1 = pe
    L8_1 = L8_1.mmap_string_rva
    L9_1 = L3_1[L7_1]
    L9_1 = L9_1.namerva
    L10_1 = 64
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = L0_1[L8_1]
    if L9_1 then
      L1_1 = L1_1 + 1
    end
  end
  if L1_1 ~= 3 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L5_1 = mp
  L5_1 = L5_1.bitor
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_FULL
  L7_1 = mp
  L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
  L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.IsKnownFriendlyFile
  L6_1 = L4_1
  L7_1 = true
  L8_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
