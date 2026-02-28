local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L1_1 = GetRollingQueueKeyValue
L2_1 = "SPVersion"
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = "SPVersion"
  L3_1 = nil
  L4_1 = nil
  L5_1 = 86400
  L6_1 = {}
  L7_1 = "14.0"
  L8_1 = "15.0"
  L9_1 = "16.0"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L6_1[3] = L9_1
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = sysio
    L12_1 = L12_1.RegOpenKey
    L13_1 = "HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
    L14_1 = L11_1
    L15_1 = "\\WSS"
    L13_1 = L13_1 .. L14_1 .. L15_1
    L12_1 = L12_1(L13_1)
    if L12_1 then
      L13_1 = sysio
      L13_1 = L13_1.RegOpenKey
      L14_1 = "HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
      L15_1 = L11_1
      L14_1 = L14_1 .. L15_1
      L13_1 = L13_1(L14_1)
      L4_1 = L13_1
      L3_1 = L11_1
    end
  end
  if L4_1 then
    L7_1 = sysio
    L7_1 = L7_1.GetRegValueAsString
    L8_1 = L4_1
    L9_1 = "Version"
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      L7_1 = "nil"
    end
    if L7_1 then
      L9_1 = L7_1
      L8_1 = L7_1.match
      L10_1 = "%.([^%.]+)$"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L9_1 = sysio
        L9_1 = L9_1.RegOpenKey
        L10_1 = "HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
        L11_1 = L3_1
        L12_1 = "\\InstalledLanguages"
        L10_1 = L10_1 .. L11_1 .. L12_1
        L9_1 = L9_1(L10_1)
        L10_1 = sysio
        L10_1 = L10_1.RegEnumValues
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        L11_1 = pairs
        L12_1 = L10_1
        L11_1, L12_1, L13_1 = L11_1(L12_1)
        for L14_1, L15_1 in L11_1, L12_1, L13_1 do
          L16_1 = string
          L16_1 = L16_1.lower
          L17_1 = sysio
          L17_1 = L17_1.GetRegValueAsString
          L18_1 = L9_1
          L19_1 = L15_1
          L17_1, L18_1, L19_1, L20_1, L21_1 = L17_1(L18_1, L19_1)
          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
          if L16_1 then
            L17_1 = string
            L17_1 = L17_1.find
            L18_1 = L16_1
            L19_1 = L8_1
            L20_1 = 1
            L21_1 = true
            L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
            if L17_1 then
              L17_1 = AppendToRollingQueue
              L18_1 = L2_1
              L19_1 = L0_1
              L20_1 = L16_1
              L21_1 = L5_1
              L17_1(L18_1, L19_1, L20_1, L21_1)
              L17_1 = bm
              L17_1 = L17_1.add_related_string
              L18_1 = "SPFullVersion"
              L19_1 = L16_1
              L20_1 = bm
              L20_1 = L20_1.RelatedStringBMReport
              L17_1(L18_1, L19_1, L20_1)
            end
          end
        end
      end
      L9_1 = AppendToRollingQueue
      L10_1 = L2_1
      L11_1 = L0_1
      L12_1 = L7_1
      L13_1 = L5_1
      L9_1(L10_1, L11_1, L12_1, L13_1)
      L9_1 = bm
      L9_1 = L9_1.add_related_string
      L10_1 = "SPVersion"
      L11_1 = L7_1
      L12_1 = bm
      L12_1 = L12_1.RelatedStringBMReport
      L9_1(L10_1, L11_1, L12_1)
    end
  end
else
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "SPVersion"
  L4_1 = L1_1
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
