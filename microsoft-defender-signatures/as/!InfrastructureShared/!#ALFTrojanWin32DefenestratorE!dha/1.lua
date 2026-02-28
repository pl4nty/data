local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.AuthenticodeContentType
  if L6_1 ~= "PE" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = L5_1.Certificates
  if L6_1 ~= nil then
    L7_1 = ipairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = L11_1.Issuer
      if L12_1 ~= nil then
        L13_1 = L12_1.CommonName
        if L13_1 ~= nil then
          L13_1 = mp
          L13_1 = L13_1.utf16to8
          L14_1 = L12_1.CommonName
          L13_1 = L13_1(L14_1)
          if L13_1 == "officeupdate.com" then
            L13_1 = mp
            L13_1 = L13_1.INFECTED
            return L13_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
