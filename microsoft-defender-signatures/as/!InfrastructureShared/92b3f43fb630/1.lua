local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = false
L1_1 = GetRollingQueue
L2_1 = "PoshevinRelatedFiles"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = type
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == "table" then
    L2_1 = pairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1 in L2_1, L3_1, L4_1 do
      L6_1 = tostring
      L7_1 = L1_1[L5_1]
      L7_1 = L7_1.key
      L6_1 = L6_1(L7_1)
      L8_1 = L6_1
      L7_1 = L6_1.match
      L9_1 = "\\.-(%..+)$"
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 then
        L8_1 = #L7_1
        if 4 < L8_1 then
          L8_1 = sysio
          L8_1 = L8_1.RegExpandUserKey
          L9_1 = "HKCU\\Software\\Classes"
          L8_1 = L8_1(L9_1)
          L9_1 = pairs
          L10_1 = L8_1
          L9_1, L10_1, L11_1 = L9_1(L10_1)
          for L12_1, L13_1 in L9_1, L10_1, L11_1 do
            L14_1 = L13_1
            L15_1 = "\\"
            L16_1 = L7_1
            L14_1 = L14_1 .. L15_1 .. L16_1
            L15_1 = sysio
            L15_1 = L15_1.RegOpenKey
            L16_1 = L14_1
            L15_1 = L15_1(L16_1)
            if L15_1 then
              L16_1 = sysio
              L16_1 = L16_1.GetRegValueAsString
              L17_1 = L15_1
              L18_1 = ""
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 then
                L17_1 = L13_1
                L18_1 = "\\"
                L19_1 = L16_1
                L17_1 = L17_1 .. L18_1 .. L19_1
                L18_1 = L17_1
                L19_1 = "\\shell\\open\\command"
                L18_1 = L18_1 .. L19_1
                L19_1 = sysio
                L19_1 = L19_1.RegOpenKey
                L20_1 = L18_1
                L19_1 = L19_1(L20_1)
                L20_1 = sysio
                L20_1 = L20_1.GetRegValueAsString
                L21_1 = L19_1
                L22_1 = ""
                L20_1 = L20_1(L21_1, L22_1)
                if L20_1 then
                  L21_1 = string
                  L21_1 = L21_1.lower
                  L22_1 = L20_1
                  L21_1 = L21_1(L22_1)
                  L23_1 = L21_1
                  L22_1 = L21_1.match
                  L24_1 = "powershell.+aescrypto.+base64"
                  L22_1 = L22_1(L23_1, L24_1)
                  if L22_1 then
                    L0_1 = true
                  end
                end
                if L0_1 then
                  L21_1 = AppendToRollingQueue
                  L22_1 = "PoshevinRelatedRegistries"
                  L23_1 = L17_1
                  L24_1 = nil
                  L25_1 = 5000
                  L21_1(L22_1, L23_1, L24_1, L25_1)
                  L21_1 = AppendToRollingQueue
                  L22_1 = "PoshevinRelatedRegistries"
                  L23_1 = L14_1
                  L24_1 = nil
                  L25_1 = 5000
                  L21_1(L22_1, L23_1, L24_1, L25_1)
                end
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 then
  L2_1 = AddResearchData
  L3_1 = "BM"
  L4_1 = true
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
