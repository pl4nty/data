local L0_1, L1_1, L2_1, L3_1
L0_1 = reportHeaders
L1_1 = {}
L2_1 = "Host"
L3_1 = "User-Agent"
L1_1[1] = L2_1
L1_1[2] = L3_1
L0_1(L1_1)
L0_1 = nri
L0_1 = L0_1.GetRawResponseBlob
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.byte
L2_1 = L0_1
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == 252 then
  L1_1 = string
  L1_1 = L1_1.byte
  L2_1 = L0_1
  L3_1 = 2
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 232 then
    L1_1 = string
    L1_1 = L1_1.byte
    L2_1 = L0_1
    L3_1 = 2
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= 72 then
      goto lbl_34
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_34::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
