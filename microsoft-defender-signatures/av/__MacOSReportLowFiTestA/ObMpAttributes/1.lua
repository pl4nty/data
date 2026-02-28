local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= "/private/tmp/4f4acd0b-bfa7-48bc-992f-386874448d0d-reportlowfitestfile-1.txt" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
else
  L1_1 = mp
  L1_1 = L1_1.ReportLowfi
  L2_1 = L0_1
  L3_1 = 373957002
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
