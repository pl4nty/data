local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
    L1_1 = "(c:\\\\user.*(desktop|downloads|documents|pictures|music|videos)|c:\\\\programdata)([\\\\*%]+)?$"
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
    L1_1 = "\\\\\\\\%.*%$"
  end
end
if L0_1 then
  L2_1 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\paths\\\\\\\\"
  L3_1 = MpCommon
  L3_1 = L3_1.StringRegExpSearch
  L4_1 = L2_1
  L5_1 = L0_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.StringRegExpSearch
    L4_1 = L1_1
    L5_1 = L0_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      goto lbl_57
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_57::
  L3_1 = bm
  L3_1 = L3_1.get_current_process_startup_info
  L3_1 = L3_1()
  if L3_1 then
    L4_1 = L3_1.ppid
    if L4_1 then
      goto lbl_68
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_68::
  L4_1 = bm
  L4_1 = L4_1.get_imagepath
  L4_1 = L4_1()
  if not L4_1 then
    L4_1 = L3_1.image_path
  end
  if not L4_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  if L4_1 then
    L5_1 = contains
    L6_1 = L4_1
    L7_1 = "svchost.exe"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = "SigHitCount_Exclusions_Susp"
      L6_1 = L0_1
      L7_1 = 86400
      L8_1 = IsKeyInRollingQueue
      L9_1 = L5_1
      L10_1 = L6_1
      L8_1, L9_1 = L8_1(L9_1, L10_1)
      L10_1 = {}
      L10_1.count = L9_1
      L10_1.key = L6_1
      if not L9_1 then
        L11_1 = AppendToRollingQueue
        L12_1 = L5_1
        L13_1 = L6_1
        L14_1 = 1
        L15_1 = L7_1
        L16_1 = 100
        L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
        L11_1 = add_parents
        L11_1()
        L11_1 = bm
        L11_1 = L11_1.add_related_string
        L12_1 = "AppliedThroughPolicy"
        L13_1 = safeJsonSerialize
        L14_1 = L10_1
        L13_1 = L13_1(L14_1)
        L14_1 = bm
        L14_1 = L14_1.RelatedStringBMReport
        L11_1(L12_1, L13_1, L14_1)
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      elseif L9_1 then
        L11_1 = tonumber
        L12_1 = L9_1
        L11_1 = L11_1(L12_1)
        L9_1 = L11_1
        if L9_1 < 5 then
          L11_1 = AppendToRollingQueue
          L12_1 = L5_1
          L13_1 = L6_1
          L14_1 = L9_1 + 1
          L15_1 = L7_1
          L16_1 = 100
          L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
          L11_1 = add_parents
          L11_1()
          L11_1 = bm
          L11_1 = L11_1.add_related_string
          L12_1 = "AppliedThroughPolicy"
          L13_1 = safeJsonSerialize
          L14_1 = L10_1
          L13_1 = L13_1(L14_1)
          L14_1 = bm
          L14_1 = L14_1.RelatedStringBMReport
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        else
          L11_1 = AppendToRollingQueue
          L12_1 = L5_1
          L13_1 = L6_1
          L14_1 = L9_1 + 1
          L15_1 = L7_1
          L16_1 = 100
          L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
      end
    end
  end
  L5_1 = add_parents
  L5_1()
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
