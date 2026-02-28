local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = sysio
L0_1 = L0_1.RegExpandUserKey
L1_1 = "HKCU\\SOFTWARE\\Microsoft\\Windows\\Shell\\Associations\\UrlAssociations\\ms-windows-store\\UserChoice"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = pairs
  L2_1 = L0_1
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    L8_1 = "hkcu@s-1-5-21-"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = sysio
      L6_1 = L6_1.RegOpenKey
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L7_1 = sysio
        L7_1 = L7_1.GetRegValueAsString
        L8_1 = L6_1
        L9_1 = "ProgId"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 then
          L8_1 = string
          L8_1 = L8_1.match
          L9_1 = L5_1
          L10_1 = "(HKCU.-)\\"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 then
            L9_1 = L8_1
            L10_1 = "\\Software\\Classes\\"
            L11_1 = L7_1
            L12_1 = "\\shell\\open\\command"
            L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1
            L10_1 = sysio
            L10_1 = L10_1.RegOpenKey
            L11_1 = L9_1
            L10_1 = L10_1(L11_1)
            if L10_1 then
              L11_1 = sysio
              L11_1 = L11_1.GetRegValueAsString
              L12_1 = L10_1
              L13_1 = ""
              L11_1 = L11_1(L12_1, L13_1)
              if L11_1 then
                L12_1 = string
                L12_1 = L12_1.len
                L13_1 = L11_1
                L12_1 = L12_1(L13_1)
                if L12_1 < 4 then
                  L12_1 = string
                  L12_1 = L12_1.lower
                  L13_1 = L11_1
                  L12_1 = L12_1(L13_1)
                  if L12_1 ~= "cmd" then
                    L12_1 = mp
                    L12_1 = L12_1.CLEAN
                    return L12_1
                  end
                end
                L12_1 = set_research_data
                L13_1 = "DefaultValue"
                L14_1 = L11_1
                L15_1 = false
                L12_1(L13_1, L14_1, L15_1)
                L12_1 = mp
                L12_1 = L12_1.GetScannedPPID
                L12_1 = L12_1()
                L13_1 = {}
                L14_1 = table
                L14_1 = L14_1.insert
                L15_1 = L13_1
                L16_1 = L12_1
                L14_1(L15_1, L16_1)
                L14_1 = MpCommon
                L14_1 = L14_1.SetPersistContextNoPath
                L15_1 = "UACBypassRegSet.A"
                L16_1 = L13_1
                L17_1 = 5
                L14_1(L15_1, L16_1, L17_1)
                L14_1 = mp
                L14_1 = L14_1.set_mpattribute
                L15_1 = "MpDisableCaching"
                L14_1(L15_1)
                L14_1 = mp
                L14_1 = L14_1.INFECTED
                return L14_1
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
