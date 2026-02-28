local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = IsProcNameInParentProcessTree
L1_1 = "BM"
L2_1 = {}
L3_1 = "senseir.exe"
L4_1 = "pangphip.exe"
L5_1 = "agentexecutor.exe"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L0_1 = "Ipconfig"
  L2_1 = this_sigattrlog
  L1_1 = L2_1[9]
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L0_1 = "NetstatN"
    L2_1 = this_sigattrlog
    L1_1 = L2_1[10]
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.matched
    if L2_1 then
      L0_1 = "NetstatS"
      L2_1 = this_sigattrlog
      L1_1 = L2_1[11]
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[12]
      L2_1 = L2_1.matched
      if L2_1 then
        L0_1 = "Arp"
        L2_1 = this_sigattrlog
        L1_1 = L2_1[12]
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[13]
        L2_1 = L2_1.matched
        if L2_1 then
          L0_1 = "RoutePrint"
          L2_1 = this_sigattrlog
          L1_1 = L2_1[13]
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[14]
          L2_1 = L2_1.matched
          if L2_1 then
            L0_1 = "QueryUser"
            L2_1 = this_sigattrlog
            L1_1 = L2_1[14]
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[15]
            L2_1 = L2_1.matched
            if L2_1 then
              L0_1 = "Whoami"
              L2_1 = this_sigattrlog
              L1_1 = L2_1[15]
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[16]
              L2_1 = L2_1.matched
              if L2_1 then
                L0_1 = "NetLocalgroup"
                L2_1 = this_sigattrlog
                L1_1 = L2_1[16]
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[17]
                L2_1 = L2_1.matched
                if L2_1 then
                  L0_1 = "NetGrpDomain"
                  L2_1 = this_sigattrlog
                  L1_1 = L2_1[17]
                else
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[18]
                  L2_1 = L2_1.matched
                  if L2_1 then
                    L0_1 = "NetUsrDomain"
                    L2_1 = this_sigattrlog
                    L1_1 = L2_1[18]
                  else
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[19]
                    L2_1 = L2_1.matched
                    if L2_1 then
                      L0_1 = "NetUser"
                      L2_1 = this_sigattrlog
                      L1_1 = L2_1[19]
                    else
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[20]
                      L2_1 = L2_1.matched
                      if L2_1 then
                        L0_1 = "NetGroup"
                        L2_1 = this_sigattrlog
                        L1_1 = L2_1[20]
                      else
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[21]
                        L2_1 = L2_1.matched
                        if L2_1 then
                          L0_1 = "NetShare"
                          L2_1 = this_sigattrlog
                          L1_1 = L2_1[21]
                        else
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[22]
                          L2_1 = L2_1.matched
                          if L2_1 then
                            L0_1 = "NetView"
                            L2_1 = this_sigattrlog
                            L1_1 = L2_1[22]
                          else
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[23]
                            L2_1 = L2_1.matched
                            if L2_1 then
                              L0_1 = "NetAccounts"
                              L2_1 = this_sigattrlog
                              L1_1 = L2_1[23]
                            else
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[24]
                              L2_1 = L2_1.matched
                              if L2_1 then
                                L0_1 = "NetStat"
                                L2_1 = this_sigattrlog
                                L1_1 = L2_1[24]
                              else
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[25]
                                L2_1 = L2_1.matched
                                if L2_1 then
                                  L0_1 = "NetFile"
                                  L2_1 = this_sigattrlog
                                  L1_1 = L2_1[25]
                                else
                                  L2_1 = this_sigattrlog
                                  L2_1 = L2_1[26]
                                  L2_1 = L2_1.matched
                                  if L2_1 then
                                    L0_1 = "NetConfig"
                                    L2_1 = this_sigattrlog
                                    L1_1 = L2_1[26]
                                  else
                                    L2_1 = this_sigattrlog
                                    L2_1 = L2_1[27]
                                    L2_1 = L2_1.matched
                                    if L2_1 then
                                      L0_1 = "Systeminfo"
                                      L2_1 = this_sigattrlog
                                      L1_1 = L2_1[27]
                                    else
                                      L2_1 = this_sigattrlog
                                      L2_1 = L2_1[28]
                                      L2_1 = L2_1.matched
                                      if L2_1 then
                                        L0_1 = "NltestDomain"
                                        L2_1 = this_sigattrlog
                                        L1_1 = L2_1[28]
                                      else
                                        L2_1 = this_sigattrlog
                                        L2_1 = L2_1[30]
                                        L2_1 = L2_1.matched
                                        if L2_1 then
                                          L0_1 = "NltestAll"
                                          L2_1 = this_sigattrlog
                                          L1_1 = L2_1[30]
                                        else
                                          L2_1 = this_sigattrlog
                                          L2_1 = L2_1[29]
                                          L2_1 = L2_1.matched
                                          if L2_1 then
                                            L0_1 = "NltestDclist"
                                            L2_1 = this_sigattrlog
                                            L1_1 = L2_1[29]
                                          else
                                            L2_1 = this_sigattrlog
                                            L2_1 = L2_1[31]
                                            L2_1 = L2_1.matched
                                            if L2_1 then
                                              L0_1 = "Pingdomain"
                                              L2_1 = this_sigattrlog
                                              L1_1 = L2_1[31]
                                            else
                                              L2_1 = this_sigattrlog
                                              L2_1 = L2_1[32]
                                              L2_1 = L2_1.matched
                                              if L2_1 then
                                                L0_1 = "CmdSet"
                                                L2_1 = this_sigattrlog
                                                L1_1 = L2_1[32]
                                              else
                                                L2_1 = mp
                                                L2_1 = L2_1.CLEAN
                                                return L2_1
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
      end
    end
  end
end
L2_1 = {}
L3_1 = {}
L4_1 = "ercservice.exe"
L5_1 = "qualysagent.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L2_1.Ipconfig = L3_1
L3_1 = {}
L4_1 = "ampwatchdog.exe"
L3_1[1] = L4_1
L2_1.NetStatN = L3_1
L3_1 = {}
L2_1.NetStatS = L3_1
L3_1 = {}
L2_1.Arp = L3_1
L3_1 = {}
L4_1 = "waappagent.exe"
L3_1[1] = L4_1
L2_1.RoutePrint = L3_1
L3_1 = {}
L4_1 = "taniumclient.exe"
L5_1 = "mssense.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L2_1.QueryUser = L3_1
L3_1 = {}
L2_1.Whoami = L3_1
L3_1 = {}
L4_1 = "emsystem.exe"
L3_1[1] = L4_1
L2_1.NetLocalgroup = L3_1
L3_1 = {}
L2_1.NetGrpDomain = L3_1
L3_1 = {}
L2_1.NetUsrDomain = L3_1
L3_1 = {}
L4_1 = "dagent.exe"
L3_1[1] = L4_1
L2_1.NetUser = L3_1
L3_1 = {}
L2_1.NetGroup = L3_1
L3_1 = {}
L4_1 = "sqlps.exe"
L5_1 = "java.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L2_1.NetShare = L3_1
L3_1 = {}
L4_1 = "oneagentplugin.exe"
L3_1[1] = L4_1
L2_1.NetView = L3_1
L3_1 = {}
L2_1.NetAccounts = L3_1
L3_1 = {}
L2_1.NetStat = L3_1
L3_1 = {}
L2_1.NetFile = L3_1
L3_1 = {}
L2_1.NetConfig = L3_1
L3_1 = {}
L4_1 = "dartcli.exe"
L5_1 = "java.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L2_1.Systeminfo = L3_1
L3_1 = {}
L2_1.NltestDomain = L3_1
L3_1 = {}
L2_1.NltestAll = L3_1
L3_1 = {}
L2_1.NltestDclist = L3_1
L3_1 = {}
L2_1.Pingdomain = L3_1
L3_1 = {}
L4_1 = "eclipse.exe"
L5_1 = "javaw.exe"
L6_1 = "java.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.CmdSet = L3_1
L3_1 = IsProcNameInParentProcessTree
L4_1 = "BM"
L5_1 = L2_1[L0_1]
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1.Ipconfig = 3
L3_1.NetStatN = 9
L3_1.NetStatS = 12
L3_1.Arp = 10
L3_1.RoutePrint = 6
L3_1.QueryUser = 3
L3_1.Whoami = 3
L3_1.NetLocalgroup = 3
L3_1.NetGroupDomain = 3
L3_1.NetUserDomain = 5
L3_1.NetUser = 3
L3_1.NetGroup = 3
L3_1.NetShare = 4
L3_1.NetView = 5
L3_1.NetAccounts = 2
L3_1.NetStat = 17
L3_1.NetFile = 16
L3_1.NetConfig = 5
L3_1.Systeminfo = 3
L3_1.NltestDomain = 6
L3_1.NltestAll = 12
L3_1.NltestDclist = 9
L3_1.Pingdomain = 3
L3_1.CmdSet = 2
L4_1 = L3_1[L0_1]
if not L4_1 then
  L4_1 = 0
end
L5_1 = {}
L5_1[20] = "L"
L5_1[40] = "M"
L5_1[60] = "H"
L5_1[80] = "H+"
L6_1 = {}
L6_1[15] = "L"
L6_1[30] = "M"
L6_1[45] = "H"
L6_1[60] = "H+"
L7_1 = "ReconTracking"
L8_1 = 14400
L9_1 = 100
L10_1 = "|"
L11_1 = bm
L11_1 = L11_1.get_current_process_startup_info
L11_1 = L11_1()
L12_1 = reportSessionInformation
L12_1 = L12_1()
L13_1 = L11_1.ppid
L14_1 = L10_1
L15_1 = L1_1.ppid
L16_1 = L10_1
L17_1 = L1_1.utf8p1
L18_1 = L10_1
L19_1 = L0_1
L20_1 = L10_1
L21_1 = L1_1.utf8p2
L13_1 = L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
L14_1 = AppendToRollingQueue
L15_1 = L7_1
L16_1 = L13_1
L17_1 = L4_1
L18_1 = L8_1
L19_1 = L9_1
L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
L14_1 = L12_1.User
if L14_1 ~= nil then
  L14_1 = L12_1.User
  L14_1 = L14_1.UserName
  if L14_1 ~= nil then
    L14_1 = L12_1.Session
    if L14_1 ~= nil then
      L14_1 = L12_1.Session
      L14_1 = L14_1.Id
      if L14_1 ~= nil then
        goto lbl_400
      end
    end
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
do return L14_1 end
::lbl_400::
L14_1 = L7_1
L15_1 = "-"
L16_1 = L12_1.User
L16_1 = L16_1.UserName
L17_1 = "[::]"
L18_1 = tostring
L19_1 = L12_1.Session
L19_1 = L19_1.Id
L18_1 = L18_1(L19_1)
L14_1 = L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1
L15_1 = AppendToRollingQueue
L16_1 = L14_1
L17_1 = L13_1
L18_1 = L4_1
L19_1 = L8_1
L20_1 = L9_1
L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
L15_1 = GetRollingQueueSumOfValues
L16_1 = L14_1
L15_1 = L15_1(L16_1)
L16_1 = CheckNewThresholdMet
L17_1 = L15_1.sum
L18_1 = L4_1
L19_1 = L6_1
L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1)
if L16_1 then
  L18_1 = copyBMEvent
  L19_1 = L1_1
  L18_1 = L18_1(L19_1)
  L1_1 = L18_1
  L18_1 = bm
  L18_1 = L18_1.add_related_string
  L19_1 = "MassRecon_"
  L20_1 = L17_1
  L21_1 = "_User"
  L19_1 = L19_1 .. L20_1 .. L21_1
  L20_1 = safeJsonSerialize
  L21_1 = {}
  L21_1.score = L15_1
  L21_1.events = L1_1
  L20_1 = L20_1(L21_1)
  L21_1 = bm
  L21_1 = L21_1.RelatedStringBMReport
  L18_1(L19_1, L20_1, L21_1)
  if L17_1 == "H+" then
    L18_1 = reportMassReconHistory
    L19_1 = L14_1
    L20_1 = L17_1
    L21_1 = "_User"
    L18_1(L19_1, L20_1, L21_1)
    L18_1 = mp
    L18_1 = L18_1.INFECTED
    return L18_1
  end
end
L18_1 = GetRollingQueueSumOfValues
L19_1 = L7_1
L18_1 = L18_1(L19_1)
L15_1 = L18_1
L18_1 = CheckNewThresholdMet
L19_1 = L15_1.sum
L20_1 = L4_1
L21_1 = L5_1
L18_1, L19_1 = L18_1(L19_1, L20_1, L21_1)
L17_1 = L19_1
L16_1 = L18_1
if L16_1 then
  L18_1 = copyBMEvent
  L19_1 = L1_1
  L18_1 = L18_1(L19_1)
  L1_1 = L18_1
  L18_1 = bm
  L18_1 = L18_1.trigger_sig
  L19_1 = "MassRecon_"
  L20_1 = L17_1
  L21_1 = "_Machine"
  L19_1 = L19_1 .. L20_1 .. L21_1
  L20_1 = safeJsonSerialize
  L21_1 = {}
  L21_1.score = L15_1
  L21_1.events = L1_1
  L20_1, L21_1, L22_1, L23_1 = L20_1(L21_1)
  L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
  if L17_1 == "H+" then
    L18_1 = reportMassReconHistory
    L19_1 = L7_1
    L20_1 = L17_1
    L21_1 = "_Machine"
    L18_1(L19_1, L20_1, L21_1)
    L18_1 = pcall
    L19_1 = reportBmInfo
    L18_1, L19_1 = L18_1(L19_1)
    if not L18_1 and L19_1 then
      L20_1 = bm
      L20_1 = L20_1.add_related_string
      L21_1 = "bmInfoFailReason"
      L22_1 = tostring
      L23_1 = L19_1
      L22_1 = L22_1(L23_1)
      L23_1 = bm
      L23_1 = L23_1.RelatedStringBMReport
      L20_1(L21_1, L22_1, L23_1)
    end
    L20_1 = mp
    L20_1 = L20_1.INFECTED
    return L20_1
  end
end
L18_1 = mp
L18_1 = L18_1.CLEAN
return L18_1
