local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 5242880 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readheader
L2_1 = 0
L3_1 = 256
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = ".pdf"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = ".doc"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = ".xls"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = ".htm"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 == nil then
        goto lbl_62
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_62::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
