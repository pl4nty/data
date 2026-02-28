local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L3_1 = L1_1
  L2_1 = L1_1.sub
  L4_1 = 1
  L5_1 = 1
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 == "." and L1_1 == ".bin" then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "->xl/macrosheets/"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:MacrosheetBin"
      L2_1(L3_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
