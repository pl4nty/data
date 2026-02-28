local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    L1_1 = "\\\\(\\w{1,2}:(\\\\*)?\\*?%?$)"
    L2_1 = MpCommon
    L2_1 = L2_1.StringRegExpSearch
    L3_1 = L1_1
    L4_1 = L0_1
    L2_1, L3_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L4_1 = bm
      L4_1 = L4_1.get_current_process_startup_info
      L4_1 = L4_1()
      if L4_1 then
        L5_1 = L4_1.ppid
        if L5_1 then
          goto lbl_36
        end
      end
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      do return L5_1 end
      ::lbl_36::
      L5_1 = bm
      L5_1 = L5_1.get_imagepath
      L5_1 = L5_1()
      if not L5_1 then
        L5_1 = L4_1.image_path
      end
      if not L5_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      if L5_1 then
        L6_1 = contains
        L7_1 = L5_1
        L8_1 = "svchost.exe"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 then
          L6_1 = "SigHitCount_Exclusions_FullDrive"
          L7_1 = L0_1
          L8_1 = 86400
          L9_1 = IsKeyInRollingQueue
          L10_1 = L6_1
          L11_1 = L7_1
          L9_1, L10_1 = L9_1(L10_1, L11_1)
          L11_1 = {}
          L11_1.count = L10_1
          L11_1.key = L7_1
          if not L10_1 then
            L12_1 = AppendToRollingQueue
            L13_1 = L6_1
            L14_1 = L7_1
            L15_1 = 1
            L16_1 = L8_1
            L17_1 = 100
            L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
            L12_1 = add_parents
            L12_1()
            L12_1 = bm
            L12_1 = L12_1.add_related_string
            L13_1 = "AppliedThroughPolicy"
            L14_1 = safeJsonSerialize
            L15_1 = L11_1
            L14_1 = L14_1(L15_1)
            L15_1 = bm
            L15_1 = L15_1.RelatedStringBMReport
            L12_1(L13_1, L14_1, L15_1)
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          elseif L10_1 then
            L12_1 = tonumber
            L13_1 = L10_1
            L12_1 = L12_1(L13_1)
            L10_1 = L12_1
            if L10_1 < 5 then
              L12_1 = AppendToRollingQueue
              L13_1 = L6_1
              L14_1 = L7_1
              L15_1 = L10_1 + 1
              L16_1 = L8_1
              L17_1 = 100
              L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
              L12_1 = add_parents
              L12_1()
              L12_1 = bm
              L12_1 = L12_1.add_related_string
              L13_1 = "AppliedThroughPolicy"
              L14_1 = safeJsonSerialize
              L15_1 = L11_1
              L14_1 = L14_1(L15_1)
              L15_1 = bm
              L15_1 = L15_1.RelatedStringBMReport
              L12_1(L13_1, L14_1, L15_1)
              L12_1 = mp
              L12_1 = L12_1.INFECTED
              return L12_1
            else
              L12_1 = AppendToRollingQueue
              L13_1 = L6_1
              L14_1 = L7_1
              L15_1 = L10_1 + 1
              L16_1 = L8_1
              L17_1 = 100
              L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
              L12_1 = mp
              L12_1 = L12_1.CLEAN
              return L12_1
            end
          end
      end
      else
        L6_1 = add_parents
        L6_1()
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
