local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "9d61afa0-cfa4-4746-95af-dc897a6f6774" then
    goto lbl_23
  end
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "3df8d417-1b4f-4b75-b289-5c016058832c" then
    goto lbl_23
  end
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "73a99e52-c380-4b86-9d47-fe1cb231f222" then
    goto lbl_23
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_23::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 52428800 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 ~= L2_1 then
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
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if L3_1 == nil or L3_1 == "" or L2_1 == nil or L2_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "conductor"
L6_1 = "Install-osquery"
L7_1 = "libcxx-build-info"
L8_1 = "-allocator-preload"
L9_1 = "libsan-conf"
L10_1 = "osquery-bandwidth-monitor"
L11_1 = "register-python-argcomplete"
L12_1 = "rollout-smf"
L13_1 = "shell_tools"
L14_1 = "shellintegration"
L15_1 = "spark-daemon"
L16_1 = "reinstall_msedge_"
L17_1 = "dirpatcher"
L18_1 = "updater_qualification_app_"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L5_1 = pairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L3_1
    L12_1 = L9_1
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = "/bin"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= 1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "/system"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= 1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "/library/apple/"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 ~= 1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L2_1
      L7_1 = "/library/installersandboxes/"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= 1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L2_1
        L7_1 = "/library/systemextensions/"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 ~= 1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L2_1
          L7_1 = "/.git/modules/"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L2_1
            L7_1 = "/.git/hooks/"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L2_1
              L7_1 = "microsoft outlook.app/contents/sharedsupport/"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L2_1
                L7_1 = "/t/.com.google.chrome."
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if L5_1 then
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L2_1
                  L7_1 = "/google"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if L5_1 then
                    goto lbl_277
                  end
                end
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L2_1
                L7_1 = "/usr/lib/google-cloud-sdk/"
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L2_1
                  L7_1 = "/usr/lib64/google-cloud-sdk/"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if not L5_1 then
                    L5_1 = string
                    L5_1 = L5_1.find
                    L6_1 = L2_1
                    L7_1 = "iterm.app/contents/resources/"
                    L8_1 = 1
                    L9_1 = true
                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                    if not L5_1 then
                      L5_1 = string
                      L5_1 = L5_1.find
                      L6_1 = L2_1
                      L7_1 = "/sbin"
                      L8_1 = 1
                      L9_1 = true
                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                      if L5_1 ~= 1 then
                        L5_1 = string
                        L5_1 = L5_1.find
                        L6_1 = L2_1
                        L7_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
                        L8_1 = 1
                        L9_1 = true
                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                        if L5_1 ~= 1 then
                          L5_1 = string
                          L5_1 = L5_1.find
                          L6_1 = L2_1
                          L7_1 = "/private/var/folders/"
                          L8_1 = 1
                          L9_1 = true
                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                          if L5_1 ~= 1 then
                            L5_1 = string
                            L5_1 = L5_1.find
                            L6_1 = L2_1
                            L7_1 = "/usr/"
                            L8_1 = 1
                            L9_1 = true
                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                            if L5_1 == 1 then
                              L5_1 = string
                              L5_1 = L5_1.find
                              L6_1 = L2_1
                              L7_1 = "/usr/local/"
                              L8_1 = 1
                              L9_1 = true
                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                              L5_1 = not L5_1
                              if L5_1 == 1 then
                                goto lbl_277
                              end
                            end
                            L5_1 = string
                            L5_1 = L5_1.find
                            L6_1 = L2_1
                            L7_1 = "/applications/microsoft defender.app/"
                            L8_1 = 1
                            L9_1 = true
                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                            if L5_1 ~= 1 then
                              goto lbl_280
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
::lbl_277::
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_280::
L5_1 = SuspMacPathsToMonitor
L6_1 = L2_1
L7_1 = "/"
L8_1 = L3_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = true
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
