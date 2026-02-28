local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = "Startup"
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L1_1 = "Shutdown"
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p1
  end
end
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = 1
L5_1 = "\\parameters"
L5_1 = #L5_1
L5_1 = -L5_1
L5_1 = L5_1 - 2
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "(.+)\\%x+"
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L3_1 = sysio
L3_1 = L3_1.GetRegValueAsString
L4_1 = L2_1
L5_1 = "FileSysPath"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = sysio
L4_1 = L4_1.GetRegValueAsString
L5_1 = L2_1
L6_1 = "GPOName"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = L4_1
L4_1 = L4_1.lower
L4_1 = L4_1(L5_1)
L5_1 = parseGpoSysvolPath
L6_1 = L3_1
L5_1, L6_1 = L5_1(L6_1)
if L4_1 ~= L6_1 then
  L7_1 = bm
  L7_1 = L7_1.add_related_string
  L8_1 = "GPO-error"
  L9_1 = "guid mismatch between network FileSysPath and GPOName registry values"
  L10_1 = bm
  L10_1 = L10_1.RelatedStringBMReport
  L7_1(L8_1, L9_1, L10_1)
end
L7_1 = sysio
L7_1 = L7_1.RegOpenKey
L8_1 = L0_1
L7_1 = L7_1(L8_1)
L8_1 = sysio
L8_1 = L8_1.GetRegValueAsString
L9_1 = L7_1
L10_1 = "Script"
L8_1 = L8_1(L9_1, L10_1)
L9_1 = L3_1
L10_1 = "\\Scripts\\"
L11_1 = L1_1
L12_1 = "\\"
L13_1 = L8_1
L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
L10_1 = getGpoDataStorePath
L11_1 = L5_1
L12_1 = L4_1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 == nil then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = L10_1
L12_1 = "\\Scripts\\"
L13_1 = L1_1
L14_1 = "\\"
L15_1 = L8_1
L11_1 = L11_1 .. L12_1 .. L13_1 .. L14_1 .. L15_1
L12_1 = {}
L12_1["{31b2f340-016d-11d2-945f-00c04fb984f9}"] = "Default Domain Policy"
L12_1["{6ac1786c-016f-11d2-945f-00c04fb984f9}"] = "Default Domain Controllers Policy"
L13_1 = L12_1[L4_1]
if L13_1 then
  L13_1 = bm
  L13_1 = L13_1.add_related_string
  L14_1 = "GPO-script-suspicious"
  L15_1 = L12_1[L4_1]
  L16_1 = bm
  L16_1 = L16_1.RelatedStringBMReport
  L13_1(L14_1, L15_1, L16_1)
end
L13_1 = sysio
L13_1 = L13_1.GetFileSize
L14_1 = L11_1
L13_1 = L13_1(L14_1)
L14_1 = GetRollingQueueKeyValue
L15_1 = "GPO-Script-LocalPath-Current"
L16_1 = L11_1
L14_1 = L14_1(L15_1, L16_1)
if L14_1 ~= L13_1 then
  L14_1 = AppendToRollingQueue
  L15_1 = "GPO-Script-NetworkPath-History"
  L16_1 = L9_1
  L17_1 = L13_1
  L18_1 = 604800
  L19_1 = 300
  L20_1 = 0
  L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
  L14_1 = AppendToRollingQueue
  L15_1 = "GPO-Script-LocalPath-History"
  L16_1 = L11_1
  L17_1 = L13_1
  L18_1 = 604800
  L19_1 = 300
  L20_1 = 0
  L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
  L14_1 = AppendToRollingQueue
  L15_1 = "GPO-Script-LocalPath-Current"
  L16_1 = L11_1
  L17_1 = L13_1
  L18_1 = 604800
  L19_1 = 300
  L20_1 = 1
  L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
  L14_1 = bm
  L14_1 = L14_1.add_related_file
  L15_1 = L11_1
  L14_1(L15_1)
end
L14_1 = mp
L14_1 = L14_1.INFECTED
return L14_1
