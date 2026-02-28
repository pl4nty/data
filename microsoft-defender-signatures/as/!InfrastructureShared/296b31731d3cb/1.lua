local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[12]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[12]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[12]
    L2_1 = L3_1.utf8p2
  end
end
if L0_1 then
  L3_1 = ipairs
  L4_1 = L0_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.ppid
    if L8_1 then
      L8_1 = L7_1.image_path
      if L8_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.image_path
        L8_1 = L8_1(L9_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "w3wp"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = add_parents_mp
          L9_1 = L9_1()
          L10_1 = nil
          L11_1 = ipairs
          L12_1 = L9_1
          L11_1, L12_1, L13_1 = L11_1(L12_1)
          for L14_1, L15_1 in L11_1, L12_1, L13_1 do
            L16_1 = L15_1.ImagePath
            if L16_1 then
              L16_1 = string
              L16_1 = L16_1.lower
              L17_1 = L15_1.ImagePath
              L16_1 = L16_1(L17_1)
              L17_1 = contains
              L18_1 = L16_1
              L19_1 = "onedrive"
              L17_1 = L17_1(L18_1, L19_1)
              if L17_1 then
                L10_1 = true
                break
              end
            end
          end
          if not L10_1 then
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            return L11_1
          end
          L11_1 = GetRollingQueueAsHashTable
          L12_1 = "RecentThreatsOnMachine"
          L11_1 = L11_1(L12_1)
          L12_1 = bm
          L12_1 = L12_1.add_related_string
          L13_1 = "Recent_Threats"
          L14_1 = L11_1
          L15_1 = bm
          L15_1 = L15_1.RelatedStringBMReport
          L12_1(L13_1, L14_1, L15_1)
          if L2_1 then
            L12_1 = string
            L12_1 = L12_1.lower
            L13_1 = L2_1
            L12_1 = L12_1(L13_1)
            L2_1 = L12_1
            L12_1 = string
            L12_1 = L12_1.find
            L13_1 = L2_1
            L14_1 = "-ap \"sharepoint"
            L15_1 = 1
            L16_1 = true
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            if L12_1 then
              L12_1 = bm
              L12_1 = L12_1.trigger_sig
              L13_1 = "SuspSharepointSession"
              L14_1 = safeJsonDeserialize
              L15_1 = L11_1
              L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L14_1(L15_1)
              L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
            end
            L12_1 = MpCommon
            L12_1 = L12_1.StringRegExpSearch
            L13_1 = "-ap\\s+\\\"[^\\\"]+"
            L14_1 = L2_1
            L12_1, L13_1 = L12_1(L13_1, L14_1)
            L14_1 = string
            L14_1 = L14_1.find
            L15_1 = L2_1
            L16_1 = "powershell"
            L17_1 = 1
            L18_1 = true
            L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
            if L14_1 and L13_1 then
              L14_1 = contains
              L15_1 = L13_1
              L16_1 = {}
              L17_1 = "wiz"
              L16_1[1] = L17_1
              L14_1 = L14_1(L15_1, L16_1)
              if L14_1 then
                L14_1 = mp
                L14_1 = L14_1.CLEAN
                return L14_1
              end
            end
          end
          L12_1 = bm
          L12_1 = L12_1.get_current_process_startup_info
          L12_1 = L12_1()
          if L12_1 then
            L13_1 = mp
            L13_1 = L13_1.GetProcessCommandLine
            L14_1 = L12_1.ppid
            L13_1 = L13_1(L14_1)
            L14_1 = MpCommon
            L14_1 = L14_1.StringRegExpSearch
            L15_1 = "(?i)(?:FromBase64String\\(\\s*['\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s'\"\\)]{35,})"
            L16_1 = L13_1
            L14_1, L15_1 = L14_1(L15_1, L16_1)
            if L14_1 then
              L16_1 = MpCommon
              L16_1 = L16_1.Base64Decode
              L17_1 = L15_1
              L16_1 = L16_1(L17_1)
              if L16_1 then
                L17_1 = string
                L17_1 = L17_1.find
                L18_1 = L16_1
                L19_1 = "ErrorActionPreference"
                L20_1 = 1
                L21_1 = true
                L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
                if L17_1 then
                  L17_1 = mp
                  L17_1 = L17_1.CLEAN
                  return L17_1
                end
              end
            end
          end
          L13_1 = mp
          L13_1 = L13_1.INFECTED
          return L13_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
