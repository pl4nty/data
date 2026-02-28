local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
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
        L8_1 = MpCommon
        L8_1 = L8_1.StringRegExpSearch
        L9_1 = "(httpd.exe|tomcat|nginx|w3wp|java|apache)"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.bitand
          L9_1 = L6_1.reason_ex
          L10_1 = 1
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 == 1 then
            L8_1 = pcall
            L9_1 = reportBmInfo
            L8_1, L9_1 = L8_1(L9_1)
            if not L8_1 and L9_1 then
              L10_1 = bm
              L10_1 = L10_1.add_related_string
              L11_1 = "bmInfoFailReason"
              L12_1 = tostring
              L13_1 = L9_1
              L12_1 = L12_1(L13_1)
              L13_1 = bm
              L13_1 = L13_1.RelatedStringBMReport
              L10_1(L11_1, L12_1, L13_1)
            end
            L10_1 = bm
            L10_1 = L10_1.get_current_process_startup_info
            L10_1 = L10_1()
            if L10_1 then
              L11_1 = L10_1.ppid
              if L11_1 then
                goto lbl_61
              end
            end
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            do return L11_1 end
            ::lbl_61::
            L11_1 = mp
            L11_1 = L11_1.GetProcessCommandLine
            L12_1 = L10_1.ppid
            L11_1 = L11_1(L12_1)
            if not L11_1 then
              L11_1 = ""
            end
            L12_1 = "((ftp|http[s]?)://[^\\\"\\s\\']+)"
            L13_1 = table_dedup
            L14_1 = multi_match_regex
            L15_1 = L11_1
            L16_1 = L12_1
            L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L14_1(L15_1, L16_1)
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
            L14_1 = {}
            L15_1 = ipairs
            L16_1 = L13_1
            L15_1, L16_1, L17_1 = L15_1(L16_1)
            for L18_1, L19_1 in L15_1, L16_1, L17_1 do
              L20_1 = UrlGrader
              L21_1 = L19_1
              L22_1 = "Behavior:Win32/PFApp_SuspCmd.A"
              L23_1 = false
              L20_1, L21_1 = L20_1(L21_1, L22_1, L23_1)
              if L20_1 < 0 then
                L22_1 = mp
                L22_1 = L22_1.CLEAN
                return L22_1
              end
              if L20_1 ~= 0 then
                L14_1[L19_1] = L21_1
              end
            end
            L15_1 = safeJsonSerialize
            L16_1 = L14_1
            L17_1 = 150
            L18_1 = nil
            L19_1 = true
            L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
            L17_1 = string
            L17_1 = L17_1.find
            L18_1 = L15_1
            L19_1 = "Susfile_extension"
            L20_1 = 1
            L21_1 = true
            L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
            if not L17_1 then
              L17_1 = mp
              L17_1 = L17_1.CLEAN
              return L17_1
            end
            L17_1 = bm
            L17_1 = L17_1.add_related_string
            L18_1 = "URL_Info"
            L19_1 = L15_1 or L19_1
            if not L15_1 then
              L19_1 = L16_1
            end
            L20_1 = bm
            L20_1 = L20_1.RelatedStringBMReport
            L17_1(L18_1, L19_1, L20_1)
            L17_1 = IsDeviceHVA
            L17_1 = L17_1()
            if L17_1 then
              L17_1 = ExtractDeviceProperties
              L17_1 = L17_1()
              L18_1 = bm
              L18_1 = L18_1.add_related_string
              L19_1 = "HVA"
              L20_1 = L17_1
              L21_1 = bm
              L21_1 = L21_1.RelatedStringBMReport
              L18_1(L19_1, L20_1, L21_1)
            end
            L17_1 = mp
            L17_1 = L17_1.INFECTED
            return L17_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
