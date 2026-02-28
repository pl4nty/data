local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
L1_1 = #L0_1
if 0 < L1_1 and L0_1 ~= nil then
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/bin"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "/system"
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
      L5_1 = "/library/installersandboxes/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "/library/systemextensions/"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/.git/modules/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "/.git/hooks/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L1_1
              L5_1 = "/sbin"
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
                  L5_1 = "/private/var/folders/"
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
                        goto lbl_156
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
                      goto lbl_159
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
::lbl_156::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_159::
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
L6_1 = L3_1
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
if 5 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = macos
L8_1 = L8_1.GetDownloadUrl
L8_1 = L8_1()
if L8_1 == nil or L8_1 == "" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = string
L9_1 = L9_1.find
L10_1 = L8_1
L11_1 = "http://"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if not L9_1 then
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L8_1
  L11_1 = "https://"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if not L9_1 then
    goto lbl_270
  end
end
L9_1 = "MAC_BROWSERDOWNLOAD_PATH"
L10_1 = mp
L10_1 = L10_1.get_contextdata
L11_1 = mp
L11_1 = L11_1.CONTEXT_DATA_PROCESS_PPID
L10_1 = L10_1(L11_1)
if L10_1 then
  L11_1 = TrackPidAndTechnique
  L12_1 = L10_1
  L13_1 = "T1566.002"
  L14_1 = "InitialAccess_Phishing_SpearphishingLink"
  L11_1(L12_1, L13_1, L14_1)
  L11_1 = MpCommon
  L11_1 = L11_1.BmTriggerSig
  L12_1 = L10_1
  L13_1 = "BM_SUSPFILE_SPEARPHISHING_LINK2"
  L14_1 = L3_1
  L11_1(L12_1, L13_1, L14_1)
end
L11_1 = AppendToRollingQueue
L12_1 = L9_1
L13_1 = "mac_browserdownload_path"
L14_1 = L3_1
L15_1 = 7200
L16_1 = 100
L17_1 = 0
L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
do return L11_1 end
::lbl_270::
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
