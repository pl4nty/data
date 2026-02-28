local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 32768 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "Lua:POSSIBLE_UPX_MAGIC"
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 558056007
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 558056007 then
  L2_1 = mp
  L2_1 = L2_1.bitand
  L3_1 = L1_1
  L4_1 = 558056001
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= 558056001 then
    goto lbl_35
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_35::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
