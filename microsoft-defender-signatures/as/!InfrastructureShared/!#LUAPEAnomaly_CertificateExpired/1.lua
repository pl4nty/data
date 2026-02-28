local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.GetDateFromTimeT
L2_1 = MpCommon
L2_1 = L2_1.GetCurrentTimeT
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L2_1()
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L4_1 = ipairs
L5_1 = L0_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.AuthenticodeContentType
  if L9_1 ~= "PE" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = L8_1.Certificates
  if L9_1 ~= nil then
    L10_1 = ipairs
    L11_1 = L9_1
    L10_1, L11_1, L12_1 = L10_1(L11_1)
    for L13_1, L14_1 in L10_1, L11_1, L12_1 do
      L15_1 = L14_1.ValidTo
      if L15_1 ~= nil then
        L16_1 = L15_1.Year
        L17_1 = L15_1.Month
        L18_1 = L15_1.Day
        if L3_1 > L16_1 or L16_1 == L3_1 and L2_1 > L17_1 or L16_1 == L3_1 and L17_1 == L2_1 and L1_1 > L18_1 then
          L19_1 = mp
          L19_1 = L19_1.INFECTED
          return L19_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
