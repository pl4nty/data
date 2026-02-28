local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L1_1
L4_1 = "/"
L1_1 = L3_1 .. L4_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/bin/"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "/system/"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= 1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "/sbin/"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= 1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "/library/apple/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/usr/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 == 1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "/usr/local/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            L3_1 = not L3_1
            if L3_1 == 1 then
              goto lbl_194
            end
          end
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/applications/microsoft defender.app/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 ~= 1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "/library/containers/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L1_1
              L5_1 = "/library/application support/microsoft edge/default/sessions/"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.find
                L4_1 = L1_1
                L5_1 = "/library/application support/firefox/profiles/"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.find
                  L4_1 = L1_1
                  L5_1 = "/library/caches/firefox/profiles/"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L1_1
                    L5_1 = "/library/preferences/com.apple"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L3_1 = string
                      L3_1 = L3_1.find
                      L4_1 = L2_1
                      L5_1 = ".crdownload"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L3_1 = string
                        L3_1 = L3_1.find
                        L4_1 = L2_1
                        L5_1 = ".part"
                        L6_1 = -5
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          L3_1 = string
                          L3_1 = L3_1.find
                          L4_1 = L2_1
                          L5_1 = ".com.google."
                          L6_1 = 1
                          L7_1 = true
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if not L3_1 then
                            L3_1 = string
                            L3_1 = L3_1.find
                            L4_1 = L2_1
                            L5_1 = ".com.microsoft.edgemac"
                            L6_1 = 1
                            L7_1 = true
                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                            if not L3_1 then
                              goto lbl_197
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
::lbl_194::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_197::
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "->(MachO-UniBin-"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.gsub
  L6_1 = "%->%(MachO%-UniBin%-.*"
  L7_1 = ""
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L3_1 = L4_1
end
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L4_1 then
  L4_1 = {}
  L5_1 = "safari"
  L6_1 = "microsoft edge"
  L7_1 = "google chrome"
  L8_1 = "firefox"
  L9_1 = "com.apple.webkit.networking"
  L10_1 = "microsoft outlook"
  L11_1 = "thunderbird"
  L12_1 = "gmail"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L4_1[7] = L11_1
  L4_1[8] = L12_1
  L5_1 = mp
  L5_1 = L5_1.get_contextdata
  L6_1 = mp
  L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
  L5_1 = L5_1(L6_1)
  if L5_1 == nil or L5_1 == "" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = pairs
  L7_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    if L10_1 ~= nil then
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L5_1
      L13_1 = L10_1
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if L11_1 == 1 then
        L11_1 = mp
        L11_1 = L11_1.set_mpattribute
        L12_1 = "BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL"
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.get_contextdata
        L12_1 = mp
        L12_1 = L12_1.CONTEXT_DATA_PROCESS_PPID
        L11_1 = L11_1(L12_1)
        L12_1 = "MAC_BROWSERDOWNLOAD_PATH"
        L13_1 = mp
        L13_1 = L13_1.GetCertificateInfo
        L13_1 = L13_1()
        L14_1 = #L13_1
        if L14_1 < 1 or L13_1 == nil then
          L15_1 = L3_1
          L14_1 = L3_1.match
          L16_1 = "(/.*)/"
          L14_1 = L14_1(L15_1, L16_1)
          L15_1 = string
          L15_1 = L15_1.find
          L16_1 = L14_1
          L17_1 = ".download"
          L18_1 = -9
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
          if L15_1 then
            L16_1 = L14_1
            L15_1 = L14_1.gsub
            L17_1 = ".download"
            L18_1 = ""
            L15_1 = L15_1(L16_1, L17_1, L18_1)
            L3_1 = L15_1
          end
          if L3_1 == "" or L3_1 == nil then
            L15_1 = mp
            L15_1 = L15_1.CLEAN
            return L15_1
          end
          if L11_1 then
            L15_1 = MpCommon
            L15_1 = L15_1.BmTriggerSig
            L16_1 = L11_1
            L17_1 = "BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL"
            L18_1 = L3_1
            L15_1(L16_1, L17_1, L18_1)
            L15_1 = TrackPidAndTechnique
            L16_1 = L11_1
            L17_1 = "T1566.002"
            L18_1 = "InitialAccess_Phishing_SpearphishingLink"
            L15_1(L16_1, L17_1, L18_1)
          end
          L15_1 = AppendToRollingQueue
          L16_1 = L12_1
          L17_1 = "mac_browserdownload_path"
          L18_1 = L3_1
          L19_1 = 7200
          L20_1 = 100
          L21_1 = 0
          L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
          L15_1 = mp
          L15_1 = L15_1.INFECTED
          return L15_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
