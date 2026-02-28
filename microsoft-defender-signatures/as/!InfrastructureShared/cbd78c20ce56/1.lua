local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = {}
L1_1 = "httpd.exe"
L2_1 = "tomcat"
L3_1 = "nginx"
L4_1 = "w3wp"
L5_1 = "apache"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 then
  L2_1 = L1_1.image_path
  if L2_1 then
    L2_1 = L1_1.image_path
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = ""
    end
    L3_1 = Contains_any_caseinsenstive
    L4_1 = L2_1
    L5_1 = L0_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.GetScannedPPID
      L3_1 = L3_1()
      if L3_1 == "" or L3_1 == nil then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = mp
      L4_1 = L4_1.GetProcessCommandLine
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L5_1 = Contains_any_caseinsenstive
        L6_1 = L4_1
        L7_1 = {}
        L8_1 = "downloadstring"
        L9_1 = "downloadfile"
        L7_1[1] = L8_1
        L7_1[2] = L9_1
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L5_1 = "((ftp|http[s]?)://[^\\\"\\s\\']+)"
          L6_1 = table_dedup
          L7_1 = multi_match_regex
          L8_1 = L4_1
          L9_1 = L5_1
          L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L7_1(L8_1, L9_1)
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
          L7_1 = {}
          L8_1 = ipairs
          L9_1 = L6_1
          L8_1, L9_1, L10_1 = L8_1(L9_1)
          for L11_1, L12_1 in L8_1, L9_1, L10_1 do
            L13_1 = UrlGrader
            L14_1 = L12_1
            L15_1 = "ALF:Trojan:Win32/PFApp_SuspDownload.A"
            L16_1 = false
            L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1)
            if L13_1 < 0 then
              L15_1 = mp
              L15_1 = L15_1.CLEAN
              return L15_1
            end
            if L13_1 ~= 0 then
              L7_1[L12_1] = L14_1
            end
          end
          L8_1 = safeJsonSerialize
          L9_1 = L7_1
          L10_1 = 150
          L11_1 = nil
          L12_1 = true
          L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          L10_1 = string
          L10_1 = L10_1.find
          L11_1 = L8_1
          L12_1 = "Susfile_extension"
          L13_1 = 1
          L14_1 = true
          L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
          if not L10_1 then
            L10_1 = mp
            L10_1 = L10_1.CLEAN
            return L10_1
          end
          L10_1 = ""
          L11_1 = IsDeviceHVA
          L11_1 = L11_1()
          if L11_1 then
            L11_1 = ExtractDeviceProperties
            L11_1 = L11_1()
            L10_1 = L11_1
          end
          L11_1 = MpCommon
          L11_1 = L11_1.BmTriggerSig
          L12_1 = L1_1.ppid
          L13_1 = "APML_SuspDownload_Servers"
          L14_1 = L4_1
          L15_1 = "[URLs]"
          L16_1 = L8_1
          L17_1 = "[HVA]"
          L18_1 = L10_1
          L14_1 = L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
