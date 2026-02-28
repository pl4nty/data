local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 and A1_2 and A2_2 then
    L3_2 = sysio
    L3_2 = L3_2.RegOpenKey
    L4_2 = A0_2
    L5_2 = "Software\\Classes\\CLSID\\"
    L6_2 = A1_2
    L7_2 = "\\InprocServer32"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = sysio
      L4_2 = L4_2.GetRegValueAsString
      L5_2 = L3_2
      L6_2 = ""
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = string
      L5_2 = L5_2.lower
      L6_2 = "\\\\?\\"
      L7_2 = L4_2
      L6_2 = L6_2 .. L7_2
      L5_2 = L5_2(L6_2)
      L6_2 = string
      L6_2 = L6_2.lower
      L7_2 = A2_2
      L6_2 = L6_2(L7_2)
      if L5_2 == L6_2 then
        L5_2 = true
        return L5_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

IsBedepInstalled = L0_1
L0_1 = sysio
L0_1 = L0_1.RegExpandUserKey
L1_1 = "HKCU"
L0_1 = L0_1(L1_1)
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = Infrastructure_ScanBedepClsid
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = ipairs
    L13_1 = Remediation
    L13_1 = L13_1.Threat
    L13_1 = L13_1.Resources
    L12_1, L13_1, L14_1 = L12_1(L13_1)
    for L15_1, L16_1 in L12_1, L13_1, L14_1 do
      L17_1 = L16_1.Schema
      if L17_1 == "file" then
        L17_1 = L16_1.Path
        if L17_1 ~= nil then
          L18_1 = IsBedepInstalled
          L19_1 = L5_1
          L20_1 = L11_1
          L21_1 = L17_1
          L18_1 = L18_1(L19_1, L20_1, L21_1)
          if L18_1 then
            L18_1 = Remediation
            L18_1 = L18_1.BtrDeleteFile
            L19_1 = L17_1
            L18_1(L19_1)
            L18_1 = sysio
            L18_1 = L18_1.RegOpenKey
            L19_1 = L5_1
            L20_1 = "Software\\Classes\\CLSID\\"
            L21_1 = L11_1
            L22_1 = "\\InprocServer32"
            L19_1 = L19_1 .. L20_1 .. L21_1 .. L22_1
            L18_1 = L18_1(L19_1)
            L19_1 = sysio
            L19_1 = L19_1.DeleteRegValue
            L20_1 = L18_1
            L21_1 = ""
            L19_1(L20_1, L21_1)
            L19_1 = sysio
            L19_1 = L19_1.RegOpenKey
            L20_1 = L5_1
            L21_1 = "Software\\Classes\\Drive\\ShellEx\\FolderExtensions\\"
            L22_1 = L11_1
            L20_1 = L20_1 .. L21_1 .. L22_1
            L19_1 = L19_1(L20_1)
            L20_1 = sysio
            L20_1 = L20_1.DeleteRegValue
            L21_1 = L19_1
            L22_1 = "DriveMask"
            L20_1(L21_1, L22_1)
          end
        end
      end
    end
  end
end
