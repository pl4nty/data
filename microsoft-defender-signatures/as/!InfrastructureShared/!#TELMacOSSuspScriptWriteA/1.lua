local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L1_1
L4_1 = "/"
L5_1 = L2_1
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = mp
L4_1 = L4_1.enum_mpattributesubstring
L5_1 = "SCPT:XPLATScriptGen"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = type
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == "table" then
    L5_1 = #L4_1
    if 0 < L5_1 then
      L5_1 = false
      L6_1 = false
      L7_1 = false
      L9_1 = L3_1
      L8_1 = L3_1.find
      L10_1 = "^/Users/[^/]+/Downloads/"
      L11_1 = 1
      L12_1 = false
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 == nil then
        L9_1 = L3_1
        L8_1 = L3_1.find
        L10_1 = "^/Users/[^/]+/Desktop/"
        L11_1 = 1
        L12_1 = false
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 == nil then
          L9_1 = L3_1
          L8_1 = L3_1.find
          L10_1 = "^/Users/[^/]+/[^/]+$"
          L11_1 = 1
          L12_1 = false
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 == nil then
            L9_1 = L3_1
            L8_1 = L3_1.find
            L10_1 = "/Library/LaunchAgents/"
            L11_1 = 1
            L12_1 = true
            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
            if L8_1 == nil then
              L9_1 = L3_1
              L8_1 = L3_1.find
              L10_1 = "/Library/LaunchDaemons/"
              L11_1 = 1
              L12_1 = true
              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
              if L8_1 == nil then
                L9_1 = L3_1
                L8_1 = L3_1.find
                L10_1 = "/Library/PrivilegedHelperTools/"
                L11_1 = 1
                L12_1 = true
                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                if L8_1 == nil then
                  L9_1 = L3_1
                  L8_1 = L3_1.find
                  L10_1 = "/Library/Application Support/[^/]+$"
                  L11_1 = 1
                  L12_1 = false
                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                  if L8_1 == nil then
                    L9_1 = L3_1
                    L8_1 = L3_1.find
                    L10_1 = "/Library/Application Support/[^/]+/[^/]+$"
                    L11_1 = 1
                    L12_1 = false
                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                    if L8_1 == nil then
                      L9_1 = L3_1
                      L8_1 = L3_1.find
                      L10_1 = "/Library/Caches/[^/]+$"
                      L11_1 = 1
                      L12_1 = false
                      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                      if L8_1 == nil then
                        L9_1 = L3_1
                        L8_1 = L3_1.find
                        L10_1 = "/Library/Caches/[^/]+/[^/]+$"
                        L11_1 = 1
                        L12_1 = false
                        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                        if L8_1 == nil then
                          L9_1 = L3_1
                          L8_1 = L3_1.find
                          L10_1 = "/Users/Shared/"
                          L11_1 = 1
                          L12_1 = true
                          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                          if L8_1 == nil then
                            L9_1 = L3_1
                            L8_1 = L3_1.find
                            L10_1 = "/var/root/[^/]+$"
                            L11_1 = 1
                            L12_1 = false
                            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                            if L8_1 == nil then
                              L9_1 = L3_1
                              L8_1 = L3_1.find
                              L10_1 = "/Library/[^/]+$"
                              L11_1 = 1
                              L12_1 = false
                              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                              if L8_1 == nil then
                                L9_1 = L3_1
                                L8_1 = L3_1.find
                                L10_1 = "/Library/[^/]+/[^/]+$"
                                L11_1 = 1
                                L12_1 = false
                                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                if L8_1 == nil then
                                  L9_1 = L3_1
                                  L8_1 = L3_1.find
                                  L10_1 = "^/Applications/[^/]+$"
                                  L11_1 = 1
                                  L12_1 = false
                                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                  if L8_1 == nil then
                                    L9_1 = L3_1
                                    L8_1 = L3_1.find
                                    L10_1 = "^/Applications/[^/]+/[^/]+$"
                                    L11_1 = 1
                                    L12_1 = false
                                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                    if L8_1 == nil then
                                      L9_1 = L3_1
                                      L8_1 = L3_1.find
                                      L10_1 = "^/private/tmp/"
                                      L11_1 = 1
                                      L12_1 = false
                                      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                      if L8_1 == nil then
                                        L9_1 = L3_1
                                        L8_1 = L3_1.find
                                        L10_1 = "^/private/var/tmp/"
                                        L11_1 = 1
                                        L12_1 = false
                                        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                        if L8_1 == nil then
                                          L9_1 = L3_1
                                          L8_1 = L3_1.find
                                          L10_1 = "^/Volumes/"
                                          L11_1 = 1
                                          L12_1 = false
                                          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                          if L8_1 == nil then
                                            L9_1 = L3_1
                                            L8_1 = L3_1.find
                                            L10_1 = "/Library/Fonts/"
                                            L11_1 = 1
                                            L12_1 = true
                                            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                            if L8_1 == nil then
                                              goto lbl_196
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
              end
            end
          end
        end
      end
      L5_1 = true
      ::lbl_196::
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L2_1
      L8_1 = L8_1(L9_1)
      if L5_1 == true then
        L10_1 = L2_1
        L9_1 = L2_1.find
        L11_1 = "^%."
        L12_1 = 1
        L13_1 = false
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 == nil then
          L10_1 = L8_1
          L9_1 = L8_1.find
          L11_1 = "apple"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if L9_1 == nil then
            L10_1 = L8_1
            L9_1 = L8_1.find
            L11_1 = "google"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if L9_1 == nil then
              L10_1 = L8_1
              L9_1 = L8_1.find
              L11_1 = "system"
              L12_1 = 1
              L13_1 = true
              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
              if L9_1 == nil then
                L10_1 = L8_1
                L9_1 = L8_1.find
                L11_1 = "update"
                L12_1 = 1
                L13_1 = true
                L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                if L9_1 == nil then
                  L10_1 = L8_1
                  L9_1 = L8_1.find
                  L11_1 = "settings"
                  L12_1 = 1
                  L13_1 = true
                  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                  if L9_1 == nil then
                    L10_1 = L8_1
                    L9_1 = L8_1.find
                    L11_1 = "install"
                    L12_1 = 1
                    L13_1 = true
                    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                    if L9_1 == nil then
                      goto lbl_252
                    end
                  end
                end
              end
            end
          end
        end
        L6_1 = true
      end
      ::lbl_252::
      L10_1 = L3_1
      L9_1 = L3_1.find
      L11_1 = "/Library/Application Support/JAMF/"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 == nil then
        L10_1 = L3_1
        L9_1 = L3_1.find
        L11_1 = "/Library/Application Support/AirWatch/"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 == nil then
          L10_1 = L3_1
          L9_1 = L3_1.find
          L11_1 = "/private/tmp/mcs/"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if L9_1 == nil then
            L10_1 = L3_1
            L9_1 = L3_1.find
            L11_1 = "/private/tmp/hubd-check.sh"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if L9_1 == nil then
              L10_1 = L3_1
              L9_1 = L3_1.find
              L11_1 = "^/private/tmp/PKInstallSandbox"
              L12_1 = 1
              L13_1 = false
              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
              if L9_1 == nil and L8_1 ~= "vpndownloader.sh" then
                L10_1 = L3_1
                L9_1 = L3_1.find
                L11_1 = "/opt/managesoft/libexec/"
                L12_1 = 1
                L13_1 = true
                L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                if L9_1 == nil then
                  goto lbl_299
                end
              end
            end
          end
        end
      end
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      do return L9_1 end
      ::lbl_299::
      if L5_1 == true then
        L10_1 = L8_1
        L9_1 = L8_1.find
        L11_1 = "ds_store"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 == nil then
          L10_1 = L2_1
          L9_1 = L2_1.find
          L11_1 = "^%._"
          L12_1 = 1
          L13_1 = false
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if L9_1 == nil then
            goto lbl_316
          end
        end
        L7_1 = true
      end
      ::lbl_316::
      if L6_1 == true or L5_1 == true or L7_1 == true then
        L9_1 = ""
        L10_1 = ipairs
        L11_1 = L4_1
        L10_1, L11_1, L12_1 = L10_1(L11_1)
        for L13_1, L14_1 in L10_1, L11_1, L12_1 do
          L15_1 = L9_1
          L16_1 = "||"
          L17_1 = tostring
          L18_1 = L14_1
          L17_1 = L17_1(L18_1)
          L9_1 = L15_1 .. L16_1 .. L17_1
        end
        L10_1 = mp
        L10_1 = L10_1.get_contextdata
        L11_1 = mp
        L11_1 = L11_1.CONTEXT_DATA_PROCESS_PPID
        L10_1 = L10_1(L11_1)
        if L9_1 ~= nil and L9_1 ~= "" then
          L11_1 = MpCommon
          L11_1 = L11_1.BmTriggerSig
          L12_1 = L10_1
          L13_1 = "Mac_SuspScriptHit"
          L14_1 = L9_1
          L11_1(L12_1, L13_1, L14_1)
        end
        if L7_1 then
          L11_1 = MpCommon
          L11_1 = L11_1.BmTriggerSig
          L12_1 = L10_1
          L13_1 = "MacSuspScriptHighConf"
          L14_1 = L3_1
          L11_1(L12_1, L13_1, L14_1)
        elseif L6_1 then
          L11_1 = MpCommon
          L11_1 = L11_1.BmTriggerSig
          L12_1 = L10_1
          L13_1 = "MacSuspScriptPathName"
          L14_1 = L3_1
          L11_1(L12_1, L13_1, L14_1)
        elseif L5_1 and not L7_1 and not L6_1 then
          L11_1 = MpCommon
          L11_1 = L11_1.BmTriggerSig
          L12_1 = L10_1
          L13_1 = "MacSuspScriptPath"
          L14_1 = L3_1
          L11_1(L12_1, L13_1, L14_1)
        end
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
