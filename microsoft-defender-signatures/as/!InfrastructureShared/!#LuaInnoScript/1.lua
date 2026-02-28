local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 800000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = -17
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == "->(innosetupdata)" then
    L2_1 = mp
    L2_1 = L2_1.readprotection
    L3_1 = false
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.readu_u32
    L3_1 = mp
    L3_1 = L3_1.readfile
    L4_1 = 0
    L5_1 = 4
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = 1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 < 256 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
