local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
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
  if not (28672 < L1_1) then
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
L3_1 = "virusshare_[%x]+"
L4_1 = 1
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "deliveryo%d%dss.xls"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "%d%d%.%d%d%.2021_siparisler%.doc"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "factur\196\131 .docx"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        goto lbl_57
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_57::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
