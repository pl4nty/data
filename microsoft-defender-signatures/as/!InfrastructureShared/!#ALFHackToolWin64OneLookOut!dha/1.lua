local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L3_1 = L1_1
  L2_1 = L1_1.sub
  L4_1 = 1
  L5_1 = 4
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 ~= "res_" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
