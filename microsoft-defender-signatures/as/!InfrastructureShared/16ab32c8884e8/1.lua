local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = string
          L1_1 = L1_1.lower
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p1
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = string
            L1_1 = L1_1.lower
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L2_1 = L2_1.utf8p1
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
          end
        end
      end
    end
  end
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetRollingQueueKeyValue
L3_1 = "app_version_"
L4_1 = L1_1
L3_1 = L3_1 .. L4_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = sysio
  L3_1 = L3_1.GetPEFixedVersionInfo
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = L3_1.FileVersion
  L5_1 = "app_version_"
  L6_1 = L1_1
  L5_1 = L5_1 .. L6_1
  L6_1 = 31536000
  L7_1 = 50
  if L4_1 ~= nil then
    L8_1 = Version_to_str
    L9_1 = L4_1
    L8_1 = L8_1(L9_1)
    L9_1 = AppendToRollingQueue
    L10_1 = L5_1
    L11_1 = L0_1
    L12_1 = L8_1
    L13_1 = L6_1
    L14_1 = L7_1
    L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
    L9_1 = bm
    L9_1 = L9_1.add_related_string
    L10_1 = "AppVersion"
    L11_1 = L8_1
    L12_1 = bm
    L12_1 = L12_1.RelatedStringBMReport
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = L3_1.OriginalFilename
    if L9_1 then
      L9_1 = bm
      L9_1 = L9_1.add_related_string
      L10_1 = "OFN"
      L11_1 = L3_1.OriginalFilename
      L12_1 = bm
      L12_1 = L12_1.RelatedStringBMReport
      L9_1(L10_1, L11_1, L12_1)
    end
  end
else
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "AppVersion"
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = GetRollingQueueKeyValue
L4_1 = "app_version_timer"
L5_1 = L1_1
L4_1 = L4_1 .. L5_1
L5_1 = L0_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = MpCommon
  L4_1 = L4_1.GetCurrentTimeT
  L4_1 = L4_1()
  L3_1 = L4_1
  L4_1 = "app_version_timer"
  L5_1 = L1_1
  L4_1 = L4_1 .. L5_1
  L5_1 = 31536000
  L6_1 = 50
  L7_1 = AppendToRollingQueue
  L8_1 = L4_1
  L9_1 = L0_1
  L10_1 = L3_1
  L11_1 = L5_1
  L12_1 = L6_1
  L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
  L7_1 = bm
  L7_1 = L7_1.add_related_string
  L8_1 = "VerLastSent"
  L9_1 = L3_1
  L10_1 = bm
  L10_1 = L10_1.RelatedStringBMReport
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L4_1 = MpCommon
L4_1 = L4_1.GetCurrentTimeT
L4_1 = L4_1()
L5_1 = L4_1 - L3_1
L5_1 = L5_1 / 60
L6_1 = L5_1 <= 21600
if L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = 31536000
L8_1 = 50
L9_1 = AppendToRollingQueue
L10_1 = "app_version_timer"
L11_1 = L1_1
L10_1 = L10_1 .. L11_1
L11_1 = L0_1
L12_1 = L4_1
L13_1 = L7_1
L14_1 = L8_1
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
