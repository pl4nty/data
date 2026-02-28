local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "(%d+);(%w+);(%w+)"
    L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "detection_weight"
    L6_1 = L1_1
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "level"
    L6_1 = L2_1
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = GetRollingQueue
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.utf8p1
    L7_1 = safeJsonSerialize
    L8_1 = L4_1
    L7_1 = L7_1(L8_1)
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = false
    L6_1 = false
    L7_1 = false
    L8_1 = false
    L9_1 = ipairs
    L10_1 = L4_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    for L12_1, L13_1 in L9_1, L10_1, L11_1 do
      L14_1 = safeJsonDeserialize
      L15_1 = L13_1.key
      L14_1 = L14_1(L15_1)
      L15_1 = L14_1.procInfo
      if not L15_1 then
        L15_1 = mp
        L15_1 = L15_1.CLEAN
        return L15_1
      end
      L15_1 = L14_1.procInfo
      L16_1 = L15_1.shellScripts
      if L16_1 then
        L16_1 = L15_1.shellScripts
        L17_1 = ipairs
        L18_1 = L16_1
        L17_1, L18_1, L19_1 = L17_1(L18_1)
        for L20_1, L21_1 in L17_1, L18_1, L19_1 do
          L22_1 = mp
          L22_1 = L22_1.ContextualExpandEnvironmentVariables
          L23_1 = L21_1
          L22_1 = L22_1(L23_1)
          if L22_1 then
            L23_1 = bm
            L23_1 = L23_1.add_related_file
            L24_1 = L22_1
            L23_1(L24_1)
            L5_1 = true
          end
        end
      end
      L16_1 = L15_1.friendly
      if not L16_1 then
        L8_1 = true
      end
      L16_1 = L15_1.hasScriptInCmdline
      if L16_1 then
        L7_1 = true
      end
      L16_1 = L15_1.avExcludedEntities
      if L16_1 then
        L16_1 = next
        L17_1 = L15_1.avExcludedEntities
        L16_1 = L16_1(L17_1)
        if L16_1 then
          L6_1 = true
        end
      end
      L16_1 = L14_1.parents
      if L16_1 then
        L16_1 = L14_1.parents
        L17_1 = ipairs
        L18_1 = L16_1
        L17_1, L18_1, L19_1 = L17_1(L18_1)
        for L20_1, L21_1 in L17_1, L18_1, L19_1 do
          L22_1 = L21_1.friendly
          if not L22_1 then
            L8_1 = true
          end
          L22_1 = L21_1.shellScripts
          if L22_1 then
            L22_1 = L21_1.shellScripts
            L23_1 = ipairs
            L24_1 = L22_1
            L23_1, L24_1, L25_1 = L23_1(L24_1)
            for L26_1, L27_1 in L23_1, L24_1, L25_1 do
              L28_1 = mp
              L28_1 = L28_1.ContextualExpandEnvironmentVariables
              L29_1 = L27_1
              L28_1 = L28_1(L29_1)
              if L28_1 then
                L29_1 = bm
                L29_1 = L29_1.add_related_file
                L30_1 = L28_1
                L29_1(L30_1)
                L5_1 = true
              end
            end
          end
        end
      end
      L16_1 = tonumber
      L17_1 = L13_1.value
      L16_1 = L16_1(L17_1)
      L17_1 = L15_1.pid
      if (L7_1 or L5_1 or L8_1) and 20 <= L16_1 then
        L18_1 = MpCommon
        L18_1 = L18_1.BmTriggerSig
        L19_1 = L17_1
        L20_1 = "MassTampering_HighScore_Event"
        L21_1 = L13_1.key
        L18_1(L19_1, L20_1, L21_1)
        L18_1 = mp
        L18_1 = L18_1.CLEAN
        return L18_1
      end
    end
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = bm
    L10_1 = L10_1.get_imagepath
    L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L10_1()
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
    if L9_1 then
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L9_1
      L12_1 = "svchost"
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 and not L5_1 and not L6_1 and not L7_1 then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
    end
  end
end
L0_1 = reportSessionInformationInclusive
L0_1()
L0_1 = reportRelevantUntrustedEntities
L1_1 = 0
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
