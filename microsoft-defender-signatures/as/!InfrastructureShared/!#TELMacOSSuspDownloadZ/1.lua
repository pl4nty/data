local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L1_1 == nil or L1_1 == "" or L0_1 == nil or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
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
L4_1 = L0_1
L5_1 = "/bin"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L0_1
  L5_1 = "/system"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= 1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L0_1
    L5_1 = "/library/apple/"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= 1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L0_1
      L5_1 = "/library/installersandboxes/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L0_1
        L5_1 = "/library/systemextensions/"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L0_1
          L5_1 = "/.git/modules/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L0_1
            L5_1 = "/.git/hooks/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L0_1
              L5_1 = "/sbin"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if L3_1 ~= 1 then
                L3_1 = string
                L3_1 = L3_1.find
                L4_1 = L0_1
                L5_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if L3_1 ~= 1 then
                  L3_1 = string
                  L3_1 = L3_1.find
                  L4_1 = L0_1
                  L5_1 = "/private/var/folders/"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if L3_1 ~= 1 then
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L0_1
                    L5_1 = "/usr/"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if L3_1 == 1 then
                      L3_1 = string
                      L3_1 = L3_1.find
                      L4_1 = L0_1
                      L5_1 = "/usr/local/"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      L3_1 = not L3_1
                      if L3_1 == 1 then
                        goto lbl_157
                      end
                    end
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L0_1
                    L5_1 = "/applications/microsoft defender.app/"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if L3_1 ~= 1 then
                      goto lbl_160
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
::lbl_157::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_160::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L0_1
L5_1 = "/contents/resources"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L0_1
  L5_1 = "/users/shared"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L0_1
    L5_1 = "/library"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L0_1
      L5_1 = "/private/tmp/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L0_1
        L5_1 = "/var/tmp/"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          goto lbl_311
        end
      end
    end
  end
end
L3_1 = macos
L3_1 = L3_1.GetDownloadUrl
L3_1 = L3_1()
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = "drive.google.com"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L3_1
  L7_1 = "linkedin.com"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L3_1
    L7_1 = ".googleusercontent.com"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L3_1
      L7_1 = "https://lnkd."
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L3_1
        L7_1 = "github."
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L3_1
          L7_1 = "raw.githubusercontent"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L3_1
            L7_1 = ".licdn.com"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              goto lbl_308
            end
          end
        end
      end
    end
  end
end
L5_1 = "MAC_BROWSERDOWNLOAD_PATH"
if L4_1 then
  L6_1 = TrackPidAndTechnique
  L7_1 = L4_1
  L8_1 = "T1566.002"
  L9_1 = "InitialAccess_Phishing_SpearphishingLink"
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = MpCommon
  L6_1 = L6_1.BmTriggerSig
  L7_1 = L4_1
  L8_1 = "BM_SUSPFILE_SPEARPHISHING_LINK"
  L9_1 = L2_1
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = AppendToRollingQueue
L7_1 = L5_1
L8_1 = "mac_browserdownload_path"
L9_1 = L2_1
L10_1 = 7200
L11_1 = 100
L12_1 = 0
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_308::
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_311::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
