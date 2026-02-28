local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = "default|current|lastKnownGood"
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p1
    L5_1 = L4_1
    L4_1 = L4_1.match
    L6_1 = "Select\\\\(%w+)"
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L4_1(L5_1, L6_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
    L1_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L0_1
    L5_1 = L1_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L2_1 = L3_1.p2
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
end
else
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SYSTEM\\Select"
L3_1 = L3_1(L4_1)
L4_1 = nil
if L3_1 then
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsDword
  L6_1 = L3_1
  L7_1 = L1_1
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.format
  L6_1 = "%03d"
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
end
L5_1 = "hklm\\system\\controlset"
L6_1 = L4_1
L7_1 = "\\SERVICES\\"
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = {}
L6_1.windefend = "(c:\\\\programdata|%programfiles%)\\\\microsoft\\\\windows defender\\\\platform\\\\[\\d\\.-]+\\\\msmpeng.exe"
L6_1.sense = "(c:\\\\program files|%programfiles%)\\\\windows defender advanced threat protection\\\\mssense.exe"
L6_1.wdfilter = "(c:\\\\windows\\\\)?system32\\\\drivers\\\\wd\\\\wdfilter.sys"
L6_1.wdboot = "(c:\\\\windows\\\\)?system32\\\\drivers\\\\wd\\\\wdboot.sys"
L7_1 = false
L8_1 = pairs
L9_1 = L6_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = L5_1
  L14_1 = L11_1
  L13_1 = L13_1 .. L14_1
  L14_1 = sysio
  L14_1 = L14_1.RegOpenKey
  L15_1 = L13_1
  L14_1 = L14_1(L15_1)
  if L14_1 then
    L15_1 = sysio
    L15_1 = L15_1.GetRegValueAsString
    L16_1 = L14_1
    L17_1 = "ImagePath"
    L15_1 = L15_1(L16_1, L17_1)
    L16_1 = string
    L16_1 = L16_1.lower
    L17_1 = L15_1
    L16_1 = L16_1(L17_1)
    L15_1 = L16_1
    if L15_1 then
      L16_1 = MpCommon
      L16_1 = L16_1.StringRegExpSearch
      L17_1 = L12_1
      L18_1 = L15_1
      L16_1, L17_1 = L16_1(L17_1, L18_1)
      if not L16_1 then
        L18_1 = bm
        L18_1 = L18_1.add_related_string
        L19_1 = "Evidence"
        L20_1 = L11_1
        L21_1 = "|"
        L22_1 = L15_1
        L20_1 = L20_1 .. L21_1 .. L22_1
        L21_1 = bm
        L21_1 = L21_1.RelatedStringBMReport
        L18_1(L19_1, L20_1, L21_1)
        L7_1 = true
      end
    else
      L16_1 = bm
      L16_1 = L16_1.add_related_string
      L17_1 = "Evidence"
      L18_1 = L11_1
      L19_1 = "|Empty"
      L18_1 = L18_1 .. L19_1
      L19_1 = bm
      L19_1 = L19_1.RelatedStringBMReport
      L16_1(L17_1, L18_1, L19_1)
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
    L16_1 = sysio
    L16_1 = L16_1.GetRegValueAsDword
    L17_1 = L14_1
    L18_1 = "Start"
    L16_1 = L16_1(L17_1, L18_1)
    if L16_1 ~= 2 and L16_1 ~= 0 then
      L17_1 = bm
      L17_1 = L17_1.add_related_string
      L18_1 = "Evidence"
      L19_1 = L11_1
      L20_1 = "|"
      L21_1 = L16_1
      L19_1 = L19_1 .. L20_1 .. L21_1
      L20_1 = bm
      L20_1 = L20_1.RelatedStringBMReport
      L17_1(L18_1, L19_1, L20_1)
      L7_1 = true
    end
  end
end
if L7_1 then
  L8_1 = tonumber
  L9_1 = readRegDQwordValue
  L10_1 = L2_1
  L9_1 = L9_1(L10_1)
  L10_1 = 16
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = 1800
  L10_1 = 100
  L11_1 = AppendToRollingQueue
  L12_1 = "MpTamperRegKeyOldValues_ControlSet"
  L13_1 = L1_1
  L14_1 = L8_1
  L15_1 = L9_1
  L16_1 = L10_1
  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
