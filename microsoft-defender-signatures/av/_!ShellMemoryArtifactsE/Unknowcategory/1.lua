local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.GetSMSMemRanges
L0_1, L1_1 = L0_1()
if L1_1 < 2 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.prot
  if L7_1 ~= 4 then
    L7_1 = L6_1.prot
    if L7_1 ~= 64 then
      goto lbl_102
    end
  end
  L7_1 = L6_1.state_type
  L8_1 = mp
  L8_1 = L8_1.bitor
  L9_1 = mp
  L9_1 = L9_1.SMS_MBI_MAPPED
  L10_1 = mp
  L10_1 = L10_1.SMS_MBI_PRIVATE
  L8_1 = L8_1(L9_1, L10_1)
  if L7_1 ~= L8_1 then
    L7_1 = L6_1.state_type
    L8_1 = mp
    L8_1 = L8_1.SMS_MBI_PRIVATE
    if L7_1 ~= L8_1 then
      goto lbl_102
    end
  end
  L7_1 = L6_1.addr
  L8_1 = L6_1.size
  L9_1 = L8_1
  if 2048 < L9_1 then
    L9_1 = 2048
  elseif L9_1 < 0 then
    L9_1 = 1024
  end
  L10_1 = mp
  L10_1 = L10_1.ReadProcMem
  L11_1 = L7_1
  L12_1 = L9_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 ~= nil then
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L10_1
    L13_1 = "This program cannot be run in DOS mode.\r\r\n"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 ~= nil and 78 <= L11_1 then
      L12_1 = 0
      L13_1 = 0
      L14_1 = L11_1 - 78
      L15_1 = mp
      L15_1 = L15_1.readu_u16
      L16_1 = L10_1
      L17_1 = L14_1
      L15_1 = L15_1(L16_1, L17_1)
      L16_1 = mp
      L16_1 = L16_1.readu_u16
      L17_1 = L10_1
      L18_1 = L14_1 + 60
      L16_1 = L16_1(L17_1, L18_1)
      L16_1 = L14_1 + L16_1
      L17_1 = L9_1 - 7
      if L16_1 < L17_1 then
        L17_1 = mp
        L17_1 = L17_1.readu_u16
        L18_1 = L10_1
        L19_1 = L16_1
        L17_1 = L17_1(L18_1, L19_1)
        L12_1 = L17_1
        L17_1 = mp
        L17_1 = L17_1.readu_u16
        L18_1 = L10_1
        L19_1 = L16_1 + 6
        L17_1 = L17_1(L18_1, L19_1)
        L13_1 = L17_1
      end
      if L15_1 == 23117 or L12_1 == 17744 or 1 <= L13_1 and L13_1 <= 16 then
        L17_1 = mp
        L17_1 = L17_1.INFECTED
        return L17_1
      end
    end
  end
  ::lbl_102::
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
