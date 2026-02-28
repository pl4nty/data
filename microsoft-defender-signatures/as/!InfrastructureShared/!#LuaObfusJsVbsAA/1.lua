local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 300 or 400000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "%->.+/"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "%->.-\\"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      goto lbl_32
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_32::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
