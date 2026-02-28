local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.GetSMSMemRanges
L0_1 = L0_1()
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.prot
  if L6_1 == 64 then
    L6_1 = L5_1.state_type
    L7_1 = mp
    L7_1 = L7_1.bitor
    L8_1 = mp
    L8_1 = L8_1.SMS_MBI_COMMIT
    L9_1 = mp
    L9_1 = L9_1.SMS_MBI_PRIVATE
    L7_1 = L7_1(L8_1, L9_1)
    if L6_1 ~= L7_1 then
      L6_1 = L5_1.state_type
      L7_1 = mp
      L7_1 = L7_1.SMS_MBI_PRIVATE
      if L6_1 ~= L7_1 then
        goto lbl_90
      end
    end
    L6_1 = L5_1.addr
    L7_1 = L5_1.size
    L8_1 = L7_1
    if 2048 < L8_1 then
      L8_1 = 2048
    end
    L9_1 = mp
    L9_1 = L9_1.ReadProcMem
    L10_1 = L6_1
    L11_1 = L8_1
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 ~= nil then
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L9_1
      L12_1 = "This program cannot be run in DOS mode.\r\r\n"
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 ~= nil and 78 <= L10_1 then
        L11_1 = 0
        L12_1 = 0
        L13_1 = L10_1 - 78
        L14_1 = mp
        L14_1 = L14_1.readu_u16
        L15_1 = L9_1
        L16_1 = L13_1
        L14_1 = L14_1(L15_1, L16_1)
        L15_1 = mp
        L15_1 = L15_1.readu_u16
        L16_1 = L9_1
        L17_1 = L13_1 + 60
        L15_1 = L15_1(L16_1, L17_1)
        L15_1 = L13_1 + L15_1
        L16_1 = L8_1 - 7
        if L15_1 < L16_1 then
          L16_1 = mp
          L16_1 = L16_1.readu_u16
          L17_1 = L9_1
          L18_1 = L15_1
          L16_1 = L16_1(L17_1, L18_1)
          L11_1 = L16_1
          L16_1 = mp
          L16_1 = L16_1.readu_u16
          L17_1 = L9_1
          L18_1 = L15_1 + 6
          L16_1 = L16_1(L17_1, L18_1)
          L12_1 = L16_1
        end
        if L14_1 == 23117 or L11_1 == 17744 or 1 <= L12_1 and L12_1 <= 16 then
          L16_1 = mp
          L16_1 = L16_1.INFECTED
          return L16_1
        end
      end
    end
  end
  ::lbl_90::
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
