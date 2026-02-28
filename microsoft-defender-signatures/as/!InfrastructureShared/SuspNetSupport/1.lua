local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L1_1 = L0_1.Active
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1.Name
  L3_1 = "Behavior:Win32/SuspNetSupport.C"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = ipairs
    L2_1 = Remediation
    L2_1 = L2_1.Threat
    L2_1 = L2_1.Resources
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = L5_1.Schema
      if L6_1 == "behavior" then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L5_1.Path
        L9_1 = "process: (%a:\\[^,]+%.exe)"
        L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L7_1(L8_1, L9_1)
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
        if L6_1 then
          L7_1 = sysio
          L7_1 = L7_1.RegExpandUserKey
          L8_1 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
          L7_1 = L7_1(L8_1)
          if L7_1 then
            L8_1 = pairs
            L9_1 = L7_1
            L8_1, L9_1, L10_1 = L8_1(L9_1)
            for L11_1, L12_1 in L8_1, L9_1, L10_1 do
              L13_1 = string
              L13_1 = L13_1.find
              L14_1 = string
              L14_1 = L14_1.lower
              L15_1 = L12_1
              L14_1 = L14_1(L15_1)
              L15_1 = "hkcu@s-1-5-21-"
              L16_1 = 1
              L17_1 = true
              L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
              if L13_1 then
                L13_1 = sysio
                L13_1 = L13_1.RegOpenKey
                L14_1 = L12_1
                L13_1 = L13_1(L14_1)
                if L13_1 then
                  L14_1 = sysio
                  L14_1 = L14_1.RegEnumValues
                  L15_1 = L13_1
                  L14_1 = L14_1(L15_1)
                  L15_1 = pairs
                  L16_1 = L14_1
                  L15_1, L16_1, L17_1 = L15_1(L16_1)
                  for L18_1, L19_1 in L15_1, L16_1, L17_1 do
                    L20_1 = string
                    L20_1 = L20_1.lower
                    L21_1 = sysio
                    L21_1 = L21_1.GetRegValueAsString
                    L22_1 = L13_1
                    L23_1 = L19_1
                    L21_1, L22_1, L23_1 = L21_1(L22_1, L23_1)
                    L20_1 = L20_1(L21_1, L22_1, L23_1)
                    if L20_1 and L20_1 == L6_1 then
                      L21_1 = sysio
                      L21_1 = L21_1.DeleteRegValue
                      L22_1 = L13_1
                      L23_1 = L19_1
                      L21_1(L22_1, L23_1)
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
