local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
L1_1 = #L0_1
if 0 < L1_1 and L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_FULL
  L1_1 = L1_1(L2_1)
  if L1_1 == nil or L1_1 == "" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = SuspMacPathsToMonitor
  L3_1 = L1_1
  L4_1 = true
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.bitor
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_FNAME
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_PATH
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L3_1(L4_1, L5_1)
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  if L3_1 == nil or L3_1 == "" or L2_1 == nil or L2_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = L2_1
  L5_1 = "/"
  L2_1 = L4_1 .. L5_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "/library/application support/microsoft edge/default/sessions/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "/library/application support/firefox/profiles/"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = "/library/caches/firefox/profiles/"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L2_1
        L6_1 = "/library/preferences/com.apple"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = ".crdownload"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = ".part"
            L7_1 = -5
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = ".com.google."
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L3_1
                L6_1 = ".com.microsoft.edgemac"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  goto lbl_134
                end
              end
            end
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_134::
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "->(MachO-UniBin-"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L5_1 = L1_1
    L4_1 = L1_1.gsub
    L6_1 = "%->%(MachO%-UniBin%-.*"
    L7_1 = ""
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L1_1 = L4_1
  end
  L4_1 = MpCommon
  L4_1 = L4_1.GetCurrentTimeT
  L4_1 = L4_1()
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = sysio
  L5_1 = L5_1.GetFileLastWriteTime
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = sysio
  L6_1 = L6_1.GetLastResult
  L6_1 = L6_1()
  L6_1 = L6_1.Success
  if L6_1 and L5_1 and L5_1 ~= 0 then
    L6_1 = L5_1 / 10000000
    L5_1 = L6_1 - 11644473600
  end
  L6_1 = L4_1 - L5_1
  if L6_1 <= 0 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = L6_1 / 60
  if 4 < L7_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = {}
  L9_1 = "safari"
  L10_1 = "microsoft edge"
  L11_1 = "google chrome"
  L12_1 = "firefox"
  L13_1 = "com.apple.webkit.networking"
  L14_1 = "microsoft outlook"
  L15_1 = "thunderbird"
  L16_1 = "gmail"
  L17_1 = "com.apple.safari.sandboxbroker"
  L8_1[1] = L9_1
  L8_1[2] = L10_1
  L8_1[3] = L11_1
  L8_1[4] = L12_1
  L8_1[5] = L13_1
  L8_1[6] = L14_1
  L8_1[7] = L15_1
  L8_1[8] = L16_1
  L8_1[9] = L17_1
  L9_1 = mp
  L9_1 = L9_1.get_contextdata
  L10_1 = mp
  L10_1 = L10_1.CONTEXT_DATA_PROCESSNAME
  L9_1 = L9_1(L10_1)
  if L9_1 == nil or L9_1 == "" then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
  L10_1 = pairs
  L11_1 = L8_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  for L13_1, L14_1 in L10_1, L11_1, L12_1 do
    if L14_1 ~= nil then
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L9_1
      L17_1 = L14_1
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 == 1 then
        L15_1 = mp
        L15_1 = L15_1.get_contextdata
        L16_1 = mp
        L16_1 = L16_1.CONTEXT_DATA_PROCESS_PPID
        L15_1 = L15_1(L16_1)
        L16_1 = "MAC_SIGNED_BROWSERDOWNLOAD_PATH"
        L18_1 = L1_1
        L17_1 = L1_1.match
        L19_1 = "(/.*)/"
        L17_1 = L17_1(L18_1, L19_1)
        L18_1 = string
        L18_1 = L18_1.find
        L19_1 = L17_1
        L20_1 = ".download"
        L21_1 = -9
        L22_1 = true
        L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
        if L18_1 then
          L19_1 = L17_1
          L18_1 = L17_1.gsub
          L20_1 = ".download"
          L21_1 = ""
          L18_1 = L18_1(L19_1, L20_1, L21_1)
          L1_1 = L18_1
        end
        if L15_1 then
          L18_1 = MpCommon
          L18_1 = L18_1.BmTriggerSig
          L19_1 = L15_1
          L20_1 = "BM_SIGNED_MACFILE_DOWNLOADFROM_BROWSERMAIL"
          L21_1 = L1_1
          L18_1(L19_1, L20_1, L21_1)
          L18_1 = TrackPidAndTechnique
          L19_1 = L15_1
          L20_1 = "T1566.002"
          L21_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
          L18_1(L19_1, L20_1, L21_1)
        end
        L18_1 = IsKeyValuePairInRollingQueue
        L19_1 = L16_1
        L20_1 = "mac_signed_browserdownload_path"
        L21_1 = string
        L21_1 = L21_1.lower
        L22_1 = L1_1
        L21_1, L22_1, L23_1, L24_1 = L21_1(L22_1)
        L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
        if not L18_1 then
          L18_1 = AppendToRollingQueue
          L19_1 = L16_1
          L20_1 = "mac_signed_browserdownload_path"
          L21_1 = string
          L21_1 = L21_1.lower
          L22_1 = L1_1
          L21_1 = L21_1(L22_1)
          L22_1 = 7200
          L23_1 = 100
          L24_1 = 0
          L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
        end
        L18_1 = mp
        L18_1 = L18_1.INFECTED
        return L18_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
