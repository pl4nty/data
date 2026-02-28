local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L0_1 then
  L2_1 = ipairs
  L3_1 = L0_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = L6_1.ppid
    if L7_1 then
      L7_1 = L6_1.image_path
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = L6_1.image_path
        L7_1 = L7_1(L8_1)
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "tomcat"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 then
          L8_1 = bm
          L8_1 = L8_1.get_current_process_startup_info
          L8_1 = L8_1()
          if L8_1 then
            L9_1 = mp
            L9_1 = L9_1.GetProcessCommandLine
            L10_1 = L8_1.ppid
            L9_1 = L9_1(L10_1)
            L10_1 = MpCommon
            L10_1 = L10_1.StringRegExpSearch
            L11_1 = "(?i)(?:FromBase64String\\(\\s*['\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s'\"\\)]{35,})"
            L12_1 = L9_1
            L10_1, L11_1 = L10_1(L11_1, L12_1)
            if L10_1 then
              L12_1 = MpCommon
              L12_1 = L12_1.Base64Decode
              L13_1 = L11_1
              L12_1 = L12_1(L13_1)
              if L12_1 then
                L13_1 = string
                L13_1 = L13_1.find
                L14_1 = L12_1
                L15_1 = "SAP Business One ServerTools"
                L16_1 = 1
                L17_1 = true
                L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
                if L13_1 then
                  L13_1 = mp
                  L13_1 = L13_1.CLEAN
                  return L13_1
                end
              end
            end
          end
          L9_1 = bm
          L9_1 = L9_1.add_related_string
          L10_1 = "Recent_Threats"
          L11_1 = GetRollingQueueAsHashTable
          L12_1 = "RecentThreatsOnMachine"
          L11_1 = L11_1(L12_1)
          L12_1 = bm
          L12_1 = L12_1.RelatedStringBMReport
          L9_1(L10_1, L11_1, L12_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
