local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = 1
L2_1 = -1
for L3_1 = L0_1, L1_1, L2_1 do
  L4_1 = sigattr_tail
  L4_1 = L4_1[L3_1]
  L5_1 = L4_1.matched
  if L5_1 then
    L5_1 = L4_1.attribute
    if L5_1 == 16393 then
      L5_1 = L4_1.utf8p1
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = L4_1.utf8p1
        L5_1 = L5_1(L6_1)
        L6_1 = false
        L7_1 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\(path|extensions)"
        L8_1 = MpCommon
        L8_1 = L8_1.StringRegExpSearch
        L9_1 = L7_1
        L10_1 = L5_1
        L8_1, L9_1 = L8_1(L9_1, L10_1)
        _ = L9_1
        L6_1 = L8_1
        if L6_1 then
          L8_1 = bm
          L8_1 = L8_1.get_current_process_startup_info
          L8_1 = L8_1()
          if L8_1 then
            L9_1 = L8_1.ppid
            if L9_1 then
              goto lbl_50
            end
          end
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          do return L9_1 end
          ::lbl_50::
          L9_1 = false
          L10_1 = mp
          L10_1 = L10_1.GetProcessCommandLine
          L11_1 = L8_1.ppid
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L11_1 = contains
            L12_1 = L10_1
            L13_1 = "gpsvc"
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 then
              L9_1 = true
          end
          else
            L11_1 = {}
            L12_1 = {}
            L13_1 = "svchost.exe"
            L14_1 = "GPSvc"
            L12_1[1] = L13_1
            L12_1[2] = L14_1
            L11_1[1] = L12_1
            L12_1 = checkParentCmdlineCaseInsensitive
            L13_1 = L8_1.ppid
            L14_1 = L11_1
            L15_1 = 5
            L12_1 = L12_1(L13_1, L14_1, L15_1)
            L9_1 = L12_1
          end
          L12_1 = L5_1
          L11_1 = L5_1.match
          L13_1 = "\\\\(.*)"
          L11_1 = L11_1(L12_1, L13_1)
          L12_1 = IsKeyInRollingQueue
          L13_1 = "gpo_broad_exclusion"
          L14_1 = L11_1
          L15_1 = true
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L13_1 = bm
          L13_1 = L13_1.get_imagepath
          L13_1 = L13_1()
          if not L13_1 then
            L13_1 = L8_1.image_path
          end
          if not L13_1 then
            L14_1 = mp
            L14_1 = L14_1.CLEAN
            return L14_1
          end
          if L13_1 then
            L14_1 = contains
            L15_1 = L13_1
            L16_1 = "svchost.exe"
            L14_1 = L14_1(L15_1, L16_1)
            if L14_1 then
              L14_1 = L5_1
              L15_1 = 86400
              L16_1 = MpCommon
              L16_1 = L16_1.AtomicCounterValue
              L17_1 = L14_1
              L16_1 = L16_1(L17_1)
              L17_1 = {}
              L18_1 = tostring
              L19_1 = L9_1
              L18_1 = L18_1(L19_1)
              L17_1.has_gpsvc_cmd = L18_1
              L18_1 = tostring
              L19_1 = L12_1
              L18_1 = L18_1(L19_1)
              L17_1.has_rq_gpo = L18_1
              L17_1.count = L16_1
              L17_1.key = L14_1
              if not L16_1 then
                L18_1 = MpCommon
                L18_1 = L18_1.AtomicCounterSet
                L19_1 = L14_1
                L20_1 = 1
                L21_1 = L15_1
                L18_1(L19_1, L20_1, L21_1)
                L18_1 = add_parents
                L18_1()
                L18_1 = bm
                L18_1 = L18_1.add_related_string
                L19_1 = "AppliedThroughPolicy"
                L20_1 = safeJsonSerialize
                L21_1 = L17_1
                L20_1 = L20_1(L21_1)
                L21_1 = bm
                L21_1 = L21_1.RelatedStringBMReport
                L18_1(L19_1, L20_1, L21_1)
              elseif L16_1 and L16_1 < 5 then
                L18_1 = MpCommon
                L18_1 = L18_1.AtomicCounterAdd
                L19_1 = L14_1
                L20_1 = 1
                L18_1(L19_1, L20_1)
                L18_1 = add_parents
                L18_1()
                L18_1 = bm
                L18_1 = L18_1.add_related_string
                L19_1 = "AppliedThroughPolicy"
                L20_1 = safeJsonSerialize
                L21_1 = L17_1
                L20_1 = L20_1(L21_1)
                L21_1 = bm
                L21_1 = L21_1.RelatedStringBMReport
                L18_1(L19_1, L20_1, L21_1)
              else
                L18_1 = MpCommon
                L18_1 = L18_1.AtomicCounterAdd
                L19_1 = L14_1
                L20_1 = 1
                L18_1(L19_1, L20_1)
                L18_1 = mp
                L18_1 = L18_1.CLEAN
                return L18_1
              end
              if L12_1 then
                L18_1 = mp
                L18_1 = L18_1.INFECTED
                return L18_1
              else
                L18_1 = bm
                L18_1 = L18_1.trigger_sig
                L19_1 = "Wide_Exclusion_Existing_Policy"
                L20_1 = L5_1
                L18_1(L19_1, L20_1)
                L18_1 = mp
                L18_1 = L18_1.CLEAN
                return L18_1
              end
          end
          else
            L14_1 = add_parents
            L14_1()
            L14_1 = mp
            L14_1 = L14_1.INFECTED
            return L14_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
