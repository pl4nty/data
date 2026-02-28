local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 65536 and 327680 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 <= 5) then
    goto lbl_27
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_27::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "lnvoice%-%d%d%d%d%d+%.pdf$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "playvm-#498-7447.pdf"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    goto lbl_46
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_46::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
