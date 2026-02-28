local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_23
  end
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if not (57344 < L1_1) then
    goto lbl_23
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_23::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "document_%d%d%d%d%d%d%d%d%d+_12%d%d2020.xls"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "document%-%d%d%d%d%d%d%d%d%d.xls"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "complaint%-copy_%d%d%d%d%d%d%d%d%d+-12%d%d2020.xls"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      goto lbl_47
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_47::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
