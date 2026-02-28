local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = nil
  L1_1 = nil
  L2_1 = nil
  L3_1 = Infrastructure_CheckProductSRPEntriesAndRemove
  L3_1()
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = Remediation
  L4_1 = L4_1.Threat
  L4_1 = L4_1.Name
  L5_1 = "Behavior:"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = sysio
    L3_1 = L3_1.RegExpandUserKey
    L4_1 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
    L3_1 = L3_1(L4_1)
    L4_1 = pairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = sysio
      L9_1 = L9_1.RegOpenKey
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      L1_1 = L9_1
      if L1_1 then
        L9_1 = sysio
        L9_1 = L9_1.RegEnumValues
        L10_1 = L1_1
        L9_1 = L9_1(L10_1)
        L0_1 = L9_1
        L9_1 = pairs
        L10_1 = L0_1
        L9_1, L10_1, L11_1 = L9_1(L10_1)
        for L12_1, L13_1 in L9_1, L10_1, L11_1 do
          if L13_1 then
            L14_1 = sysio
            L14_1 = L14_1.GetRegValueAsString
            L15_1 = L1_1
            L16_1 = L13_1
            L14_1 = L14_1(L15_1, L16_1)
            L2_1 = L14_1
            if L2_1 then
              L14_1 = nil
              L15_1 = nil
              L16_1 = nil
              L17_1 = 0
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L2_1
              L20_1 = "^regsvr32(.+\".+\\)([^\\]+)\"$"
              L18_1, L19_1 = L18_1(L19_1, L20_1)
              L15_1 = L19_1
              L14_1 = L18_1
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L15_1
              L20_1 = ".([^.]+)$"
              L18_1 = L18_1(L19_1, L20_1)
              L16_1 = L18_1
              if L14_1 ~= nil and L15_1 ~= nil and L16_1 ~= nil and L16_1 ~= "dll" and L16_1 ~= "ocx" then
                L18_1 = string
                L18_1 = L18_1.len
                L19_1 = L15_1
                L18_1 = L18_1(L19_1)
                L17_1 = L18_1
                if 8 <= L17_1 and L17_1 <= 18 then
                  L18_1 = string
                  L18_1 = L18_1.find
                  L19_1 = L2_1
                  L20_1 = "\""
                  L21_1 = 1
                  L22_1 = true
                  L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
                  if L18_1 then
                    L20_1 = L2_1
                    L19_1 = L2_1.sub
                    L21_1 = L18_1
                    L19_1 = L19_1(L20_1, L21_1)
                    L14_1 = L19_1
                    L19_1 = Remediation
                    L19_1 = L19_1.BtrDeleteRegValue
                    L20_1 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\\\"
                    L21_1 = L13_1
                    L20_1 = L20_1 .. L21_1
                    L19_1(L20_1)
                    L19_1 = sysio
                    L19_1 = L19_1.IsFileExists
                    L20_1 = L14_1
                    L19_1 = L19_1(L20_1)
                    if L19_1 then
                      L19_1 = Remediation
                      L19_1 = L19_1.BtrDeleteFile
                      L20_1 = L14_1
                      L19_1(L20_1)
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
