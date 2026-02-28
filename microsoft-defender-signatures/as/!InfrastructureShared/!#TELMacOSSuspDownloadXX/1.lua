local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
if L1_1 == nil or L1_1 == "" or L0_1 == nil or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1
L3_1 = "/"
L0_1 = L2_1 .. L3_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "/bin/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/system/"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "/sbin/"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= 1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "/library/apple/"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= 1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= 1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "/usr/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 == 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "/usr/local/"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            L2_1 = not L2_1
            if L2_1 == 1 then
              goto lbl_184
            end
          end
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "/applications/microsoft defender.app/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "/library/containers/"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L0_1
              L4_1 = "/library/application support/microsoft edge/default/sessions/"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L0_1
                L4_1 = "/library/application support/firefox/profiles/"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L0_1
                  L4_1 = "/library/caches/firefox/profiles/"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L0_1
                    L4_1 = "/library/preferences/com.apple"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = ".crdownload"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L1_1
                        L4_1 = ".part"
                        L5_1 = -5
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          L2_1 = string
                          L2_1 = L2_1.find
                          L3_1 = L1_1
                          L4_1 = ".com.google."
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if not L2_1 then
                            L2_1 = string
                            L2_1 = L2_1.find
                            L3_1 = L1_1
                            L4_1 = ".com.microsoft.edgemac"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if not L2_1 then
                              goto lbl_187
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
::lbl_184::
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_187::
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "->(MachO-UniBin-"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.gsub
  L5_1 = "%->%(MachO%-UniBin%-.*"
  L6_1 = ""
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.GetCurrentTimeT
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetFileLastWriteTime
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.GetLastResult
L5_1 = L5_1()
L5_1 = L5_1.Success
if L5_1 and L4_1 and L4_1 ~= 0 then
  L5_1 = L4_1 / 10000000
  L4_1 = L5_1 - 11644473600
end
L5_1 = L3_1 - L4_1
if L5_1 <= 0 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L5_1 / 60
if 5 < L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L8_1 = "safari"
L9_1 = "microsoft edge"
L10_1 = "google chrome"
L11_1 = "firefox"
L12_1 = "com.apple.webkit.networking"
L13_1 = "microsoft outlook"
L14_1 = "thunderbird"
L15_1 = "gmail"
L16_1 = "com.apple.safari.sandboxbroker"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L7_1[4] = L11_1
L7_1[5] = L12_1
L7_1[6] = L13_1
L7_1[7] = L14_1
L7_1[8] = L15_1
L7_1[9] = L16_1
L8_1 = mp
L8_1 = L8_1.get_contextdata
L9_1 = mp
L9_1 = L9_1.CONTEXT_DATA_PROCESSNAME
L8_1 = L8_1(L9_1)
if L8_1 == nil or L8_1 == "" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = string
L9_1 = L9_1.lower
L10_1 = L8_1
L9_1 = L9_1(L10_1)
L8_1 = L9_1
L9_1 = pairs
L10_1 = L7_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  if L13_1 ~= nil then
    L14_1 = string
    L14_1 = L14_1.find
    L15_1 = L8_1
    L16_1 = L13_1
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if L14_1 == 1 then
      L14_1 = mp
      L14_1 = L14_1.get_contextdata
      L15_1 = mp
      L15_1 = L15_1.CONTEXT_DATA_PROCESS_PPID
      L14_1 = L14_1(L15_1)
      L15_1 = mp
      L15_1 = L15_1.GetCertificateInfo
      L15_1 = L15_1()
      L16_1 = #L15_1
      if L16_1 < 1 or L15_1 == nil then
        L16_1 = "MAC_BROWSERDOWNLOAD_PATH"
        L17_1 = "MAC_UNS_ADHOC_PATHS"
        L19_1 = L2_1
        L18_1 = L2_1.match
        L20_1 = "(/.*)/"
        L18_1 = L18_1(L19_1, L20_1)
        L19_1 = string
        L19_1 = L19_1.find
        L20_1 = L18_1
        L21_1 = ".download"
        L22_1 = -9
        L23_1 = true
        L19_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
        if L19_1 then
          L20_1 = L18_1
          L19_1 = L18_1.gsub
          L21_1 = ".download"
          L22_1 = ""
          L19_1 = L19_1(L20_1, L21_1, L22_1)
          L2_1 = L19_1
        end
        if L14_1 then
          L19_1 = MpCommon
          L19_1 = L19_1.BmTriggerSig
          L20_1 = L14_1
          L21_1 = "BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL2"
          L22_1 = L2_1
          L19_1(L20_1, L21_1, L22_1)
          L19_1 = MpCommon
          L19_1 = L19_1.BmTriggerSig
          L20_1 = L14_1
          L21_1 = "BM_UnsignedOrAdhocMacBin"
          L22_1 = L2_1
          L19_1(L20_1, L21_1, L22_1)
          L19_1 = TrackPidAndTechnique
          L20_1 = L14_1
          L21_1 = "T1566.002"
          L22_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
          L19_1(L20_1, L21_1, L22_1)
        end
        L19_1 = AppendToRollingQueue
        L20_1 = L16_1
        L21_1 = "mac_browserdownload_path"
        L22_1 = L2_1
        L23_1 = 7200
        L24_1 = 100
        L25_1 = 0
        L19_1(L20_1, L21_1, L22_1, L23_1, L24_1, L25_1)
        L19_1 = 86400
        L20_1 = IsKeyValuePairInRollingQueue
        L21_1 = L17_1
        L22_1 = "unsigned_adhoc_items"
        L23_1 = L2_1
        L20_1 = L20_1(L21_1, L22_1, L23_1)
        if not L20_1 then
          L20_1 = AppendToRollingQueue
          L21_1 = L17_1
          L22_1 = "unsigned_adhoc_items"
          L23_1 = L2_1
          L24_1 = L19_1
          L25_1 = 200
          L26_1 = 0
          L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
        end
        L20_1 = mp
        L20_1 = L20_1.INFECTED
        return L20_1
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
