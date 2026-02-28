local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SIGATTR:GoogleSoftwareRemovalTool"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 0 < L1_1 then
    L1_1 = ipairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = L5_1.AuthenticodeContentType
      if L6_1 == "PE" then
        L6_1 = L5_1.Certificates
        if L6_1 ~= nil then
          L7_1 = ipairs
          L8_1 = L6_1
          L7_1, L8_1, L9_1 = L7_1(L8_1)
          for L10_1, L11_1 in L7_1, L8_1, L9_1 do
            L12_1 = L11_1.Subject
            if L12_1 ~= nil then
              L13_1 = L12_1.Organization
              if L13_1 ~= nil then
                L13_1 = mp
                L13_1 = L13_1.utf16to8
                L14_1 = L12_1.Organization
                L13_1 = L13_1(L14_1)
                if L13_1 == "Google Inc" then
                  L13_1 = mp
                  L13_1 = L13_1.CLEAN
                  return L13_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.HSTR_WEIGHT
if 3 <= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
