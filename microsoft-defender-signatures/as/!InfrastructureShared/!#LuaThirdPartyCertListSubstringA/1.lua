local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "table" then
    L1_1 = #L0_1
    if L1_1 ~= 0 then
      goto lbl_17
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = {}
L1_1.mcafee = "mcafee"
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.AuthenticodeContentType
  if L7_1 ~= nil then
    L7_1 = L6_1.AuthenticodeContentType
    if L7_1 == "PE" then
      goto lbl_32
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  do return L7_1 end
  ::lbl_32::
  L7_1 = L6_1.Certificates
  if L7_1 ~= nil then
    L8_1 = type
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 == "table" then
      L8_1 = pairs
      L9_1 = L6_1.Certificates
      L8_1, L9_1, L10_1 = L8_1(L9_1)
      for L11_1, L12_1 in L8_1, L9_1, L10_1 do
        L13_1 = L12_1.Subject
        if L13_1 ~= nil then
          L14_1 = type
          L15_1 = L12_1
          L14_1 = L14_1(L15_1)
          if L14_1 == "table" then
            L14_1 = L13_1.Organization
            if L14_1 ~= nil then
              L15_1 = type
              L16_1 = L14_1
              L15_1 = L15_1(L16_1)
              if L15_1 == "string" then
                L15_1 = string
                L15_1 = L15_1.lower
                L16_1 = mp
                L16_1 = L16_1.utf16to8
                L17_1 = L14_1
                L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1 = L16_1(L17_1)
                L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1)
                L16_1 = pairs
                L17_1 = L1_1
                L16_1, L17_1, L18_1 = L16_1(L17_1)
                for L19_1, L20_1 in L16_1, L17_1, L18_1 do
                  L21_1 = string
                  L21_1 = L21_1.find
                  L22_1 = L15_1
                  L23_1 = L19_1
                  L24_1 = 1
                  L25_1 = true
                  L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
                  if L21_1 ~= nil then
                    L21_1 = "Lua:ThirdPartyCertListSubstring.A!"
                    L22_1 = L20_1
                    L21_1 = L21_1 .. L22_1
                    L22_1 = mp
                    L22_1 = L22_1.set_mpattribute
                    L23_1 = L21_1
                    L22_1(L23_1)
                    L22_1 = mp
                    L22_1 = L22_1.INFECTED
                    return L22_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
