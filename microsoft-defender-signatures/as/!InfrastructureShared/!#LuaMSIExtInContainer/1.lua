local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if 4 < L1_1 then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -4
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == ".msi" then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:MSIExtInContainer"
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
