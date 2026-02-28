local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
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
                        goto lbl_161
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
                      goto lbl_164
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
::lbl_161::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_164::
L3_1 = IsExcludedByImagePathMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
L3_1 = L3_1(L4_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L1_1
L6_1 = "/contents/resources"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "/users/shared"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "/library"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      goto lbl_238
    end
  end
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "."
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "/."
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_238
  end
end
if L3_1 then
  L4_1 = TrackPidAndTechnique
  L5_1 = L3_1
  L6_1 = "T1564.001"
  L7_1 = "DefenseEvasion_HiddenFilesandDirectories"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = MpCommon
  L4_1 = L4_1.BmTriggerSig
  L5_1 = L3_1
  L6_1 = "BM_SuspMacHiddenFileFolder"
  L7_1 = L1_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_238::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
