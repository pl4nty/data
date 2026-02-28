local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
        L7_1 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\processes\\\\\\\\"
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
          L9_1 = bm
          L9_1 = L9_1.get_imagepath
          L9_1 = L9_1()
          if not L9_1 then
            L9_1 = L8_1.image_path
          end
          if not L9_1 then
            L10_1 = mp
            L10_1 = L10_1.CLEAN
            return L10_1
          end
          if L9_1 then
            L10_1 = contains
            L11_1 = L9_1
            L12_1 = "svchost.exe"
            L10_1 = L10_1(L11_1, L12_1)
            if L10_1 then
              L10_1 = versioning
              L10_1 = L10_1.GetOrgID
              L10_1 = L10_1()
              if L10_1 then
                L12_1 = L10_1
                L11_1 = L10_1.lower
                L11_1 = L11_1(L12_1)
                L10_1 = L11_1
                L11_1 = crypto
                L11_1 = L11_1.Sha1Buffer
                L12_1 = L10_1
                L13_1 = 0
                L14_1 = #L10_1
                L11_1 = L11_1(L12_1, L13_1, L14_1)
                L10_1 = L11_1
                if L10_1 == "f9a615dbb6affe49419dfe781bff51340f37e8fa" or L10_1 == "ebcfa46ce0defff07d341c8cca024ee1e826a9fa" or L10_1 == "5199817d05cd84cdcda32b87524adcafaf4c60bf" then
                  L11_1 = mp
                  L11_1 = L11_1.CLEAN
                  return L11_1
                end
              end
              L11_1 = L5_1
              L12_1 = 86400
              L13_1 = MpCommon
              L13_1 = L13_1.AtomicCounterValue
              L14_1 = L11_1
              L13_1 = L13_1(L14_1)
              L14_1 = {}
              L14_1.count = L13_1
              L14_1.key = L11_1
              if not L13_1 then
                L14_1.count = 0
                L15_1 = MpCommon
                L15_1 = L15_1.AtomicCounterSet
                L16_1 = L11_1
                L17_1 = 1
                L18_1 = L12_1
                L15_1(L16_1, L17_1, L18_1)
                L15_1 = add_parents
                L15_1()
                L15_1 = bm
                L15_1 = L15_1.add_related_string
                L16_1 = "AppliedThroughPolicy"
                L17_1 = safeJsonSerialize
                L18_1 = L14_1
                L17_1 = L17_1(L18_1)
                L18_1 = bm
                L18_1 = L18_1.RelatedStringBMReport
                L15_1(L16_1, L17_1, L18_1)
                L15_1 = mp
                L15_1 = L15_1.INFECTED
                return L15_1
              elseif L13_1 and L13_1 < 5 then
                L15_1 = MpCommon
                L15_1 = L15_1.AtomicCounterAdd
                L16_1 = L11_1
                L17_1 = 1
                L15_1(L16_1, L17_1)
                L15_1 = add_parents
                L15_1()
                L15_1 = bm
                L15_1 = L15_1.add_related_string
                L16_1 = "AppliedThroughPolicy"
                L17_1 = safeJsonSerialize
                L18_1 = L14_1
                L17_1 = L17_1(L18_1)
                L18_1 = bm
                L18_1 = L18_1.RelatedStringBMReport
                L15_1(L16_1, L17_1, L18_1)
                L15_1 = mp
                L15_1 = L15_1.INFECTED
                return L15_1
              else
                L15_1 = MpCommon
                L15_1 = L15_1.AtomicCounterAdd
                L16_1 = L11_1
                L17_1 = 1
                L15_1(L16_1, L17_1)
                L15_1 = mp
                L15_1 = L15_1.CLEAN
                return L15_1
              end
          end
          else
            L10_1 = add_parents
            L10_1()
            L10_1 = pcall
            L11_1 = reportBmInfo
            L10_1, L11_1 = L10_1(L11_1)
            if not L10_1 and L11_1 then
              L12_1 = bm
              L12_1 = L12_1.add_related_string
              L13_1 = "bmInfoFailReason"
              L14_1 = tostring
              L15_1 = L11_1
              L14_1 = L14_1(L15_1)
              L15_1 = bm
              L15_1 = L15_1.RelatedStringBMReport
              L12_1(L13_1, L14_1, L15_1)
            end
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
