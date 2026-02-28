local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = Remediation
if L0_1 then
  L0_1 = Remediation
  L0_1 = L0_1.Threat
end
if L0_1 ~= nil then
  L1_1 = L0_1.Resources
  if L1_1 ~= nil then
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    if L1_1 ~= nil then
      L1_1 = Remediation
      L1_1 = L1_1.Threat
      L1_1 = L1_1.Name
      if L1_1 == "Trojan:Script/Stoufis.A" then
        L1_1 = L0_1.Resources
        L2_1 = ipairs
        L3_1 = L1_1
        L2_1, L3_1, L4_1 = L2_1(L3_1)
        for L5_1, L6_1 in L2_1, L3_1, L4_1 do
          L7_1 = L6_1.Path
          L8_1 = L6_1.Schema
          if L8_1 == "file" and L7_1 ~= nil then
            L8_1 = #L7_1
            if 4 < L8_1 then
              L8_1 = string
              L8_1 = L8_1.lower
              L9_1 = normalize_path
              L10_1 = L7_1
              L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L9_1(L10_1)
              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
              L7_1 = L8_1
              L8_1 = GetRollingQueue
              L9_1 = "UrlFileInStartupTargetA"
              L8_1 = L8_1(L9_1)
              L9_1 = isnull
              L10_1 = L8_1
              L9_1 = L9_1(L10_1)
              if not L9_1 then
                L9_1 = pairs
                L10_1 = L8_1
                L9_1, L10_1, L11_1 = L9_1(L10_1)
                for L12_1 in L9_1, L10_1, L11_1 do
                  L13_1 = L8_1[L12_1]
                  L13_1 = L13_1.key
                  if L13_1 ~= nil and L13_1 == L7_1 then
                    L14_1 = L8_1[L12_1]
                    L14_1 = L14_1.value
                    if L14_1 ~= nil then
                      L15_1 = #L14_1
                      if 64 < L15_1 then
                        L15_1 = StringEndsWith
                        L16_1 = L14_1
                        L17_1 = ".url"
                        L15_1 = L15_1(L16_1, L17_1)
                        if L15_1 then
                          L15_1 = string
                          L15_1 = L15_1.find
                          L16_1 = L14_1
                          L17_1 = "\\windows\\start menu\\programs\\startup\\"
                          L18_1 = 1
                          L19_1 = true
                          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
                          if L15_1 then
                            L15_1 = sysio
                            L15_1 = L15_1.DeleteFile
                            L16_1 = L14_1
                            L15_1(L16_1)
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
      end
    end
  end
end
