local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
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
    L5_1 = "/sbin"
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
        L5_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
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
              goto lbl_112
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
            goto lbl_115
          end
        end
      end
    end
  end
end
::lbl_112::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_115::
L3_1 = {}
L4_1 = "job"
L5_1 = "offer"
L6_1 = "stability"
L7_1 = "bridges"
L8_1 = "coinbase"
L9_1 = "careers"
L10_1 = "finderfontsupdater"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L4_1 = pairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  if L8_1 ~= nil then
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L1_1
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = macos
      L9_1 = L9_1.GetDownloadUrl
      L9_1 = L9_1()
      if L9_1 == "" or L9_1 == nil then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
      L10_1 = mp
      L10_1 = L10_1.get_contextdata
      L11_1 = mp
      L11_1 = L11_1.CONTEXT_DATA_PROCESS_PPID
      L10_1 = L10_1(L11_1)
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L9_1
      L13_1 = "drive.google.com"
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if not L11_1 then
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L9_1
        L13_1 = "linkedin.com"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L9_1
          L13_1 = ".googleusercontent.com"
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if not L11_1 then
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L9_1
            L13_1 = "https://lnkd."
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if not L11_1 then
              L11_1 = string
              L11_1 = L11_1.find
              L12_1 = L9_1
              L13_1 = "github."
              L14_1 = 1
              L15_1 = true
              L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
              if not L11_1 then
                L11_1 = string
                L11_1 = L11_1.find
                L12_1 = L9_1
                L13_1 = "raw.githubusercontent"
                L14_1 = 1
                L15_1 = true
                L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
                if not L11_1 then
                  L11_1 = string
                  L11_1 = L11_1.find
                  L12_1 = L9_1
                  L13_1 = ".licdn.com"
                  L14_1 = 1
                  L15_1 = true
                  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
                  if not L11_1 then
                    goto lbl_242
                  end
                end
              end
            end
          end
        end
      end
      L11_1 = "MAC_BROWSERDOWNLOAD_PATH"
      if L10_1 then
        L12_1 = TrackPidAndTechnique
        L13_1 = L10_1
        L14_1 = "T1566.002"
        L15_1 = "InitialAccess_Phishing_SpearphishingLink"
        L12_1(L13_1, L14_1, L15_1)
        L12_1 = MpCommon
        L12_1 = L12_1.BmTriggerSig
        L13_1 = L10_1
        L14_1 = "BM_SUSPFILE_SPEARPHISHING_LINK"
        L15_1 = L2_1
        L12_1(L13_1, L14_1, L15_1)
      end
      L12_1 = AppendToRollingQueue
      L13_1 = L11_1
      L14_1 = "mac_browserdownload_path"
      L15_1 = L2_1
      L16_1 = 7200
      L17_1 = 100
      L18_1 = 0
      L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
      L12_1 = mp
      L12_1 = L12_1.INFECTED
      do return L12_1 end
      ::lbl_242::
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
