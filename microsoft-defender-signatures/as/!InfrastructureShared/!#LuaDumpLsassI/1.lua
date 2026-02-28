local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 9) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
if L0_1 == "lsass.dmp" then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -5
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == ").dmp" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 1
  L4_1 = 7
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 == "lsass (" then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
