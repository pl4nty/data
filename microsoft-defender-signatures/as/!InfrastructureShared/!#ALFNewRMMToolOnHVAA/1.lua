-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFNewRMMToolOnHVAA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["anydesk.exe"] = "AnyDesk"
l_0_2["screenconnect.clientservice.exe"] = "ScreenConnect"
l_0_2["screenconnect.windowsclient.exe"] = "ScreenConnect"
l_0_2["ctespersistence.exe"] = "ScreenConnect"
l_0_2["cteshostsvc.exe"] = "ScreenConnect"
l_0_2["cagservice.exe"] = "ScreenConnect"
l_0_2["teamviewer.exe"] = "TeamViewer"
l_0_2["teamviewer_service.exe"] = "TeamViewer"
l_0_2["tv_w32.exe"] = "TeamViewer"
l_0_2["tv_x64.exe"] = "TeamViewer"
l_0_2["splashtop.exe"] = "Splashtop"
l_0_2["srstreamer.exe"] = "Splashtop"
l_0_2["splashtop_streamer.exe"] = "Splashtop"
l_0_2["ateraagent.exe"] = "Atera"
l_0_2["logmein.exe"] = "LogMeIn"
l_0_2["lmiguardiansvc.exe"] = "LogMeIn"
l_0_2["client32.exe"] = "NetSupport"
l_0_2["pcictlui.exe"] = "NetSupport"
l_0_2["action1_agent.exe"] = "Action1"
l_0_2["action1_remote.exe"] = "Action1"
l_0_2["meshagent.exe"] = "MeshAgent"
l_0_2["rustdesk.exe"] = "RustDesk"
l_0_2["mobaxterm.exe"] = "MobaXterm"
l_0_2["tvnserver.exe"] = "TightVNC"
l_0_2["tvnviewer.exe"] = "TightVNC"
l_0_2["vncserverui.exe"] = "VNC"
l_0_2["vncviewer.exe"] = "VNC"
l_0_2["winvnc4.exe"] = "VNC"
l_0_2["vncserver.exe"] = "VNC"
l_0_2["vncconfig.exe"] = "VNC"
l_0_2["vncaddrbook.exe"] = "VNC"
l_0_2["radmin.exe"] = "Radmin"
l_0_2["rserver3.exe"] = "Radmin"
l_0_2["rpcviewerui.exe"] = "Radmin"
l_0_2["simplehelp.exe"] = "SimpleHelp"
l_0_2["simpleservice.exe"] = "SimpleHelp"
l_0_2["zohoassist.exe"] = "ZohoAssist"
l_0_2["zaservice.exe"] = "ZohoAssist"
l_0_2["ninjarmmagent.exe"] = "NinjaOne"
l_0_2["ninjaremote.exe"] = "NinjaOne"
l_0_2["tacticalrmm.exe"] = "TacticalRMM"
l_0_2["pdqdeploy.exe"] = "PDQDeploy"
l_0_2["pdqdeployconsole.exe"] = "PDQDeploy"
l_0_2["pdqrunner.exe"] = "PDQDeploy"
l_0_2["pdqinventoryconsole.exe"] = "PDQDeploy"
l_0_2["pdqinventoryscanner.exe"] = "PDQDeploy"
l_0_2["supremo.exe"] = "Supremo"
l_0_2["supremoservice.exe"] = "Supremo"
l_0_2["syncromsp.exe"] = "Syncro"
l_0_2["dwagent.exe"] = "DWAgent"
l_0_2["dwagsvc.exe"] = "DWAgent"
l_0_2["ehorus_agent.exe"] = "eHorus"
l_0_2["ehorus_tray.exe"] = "eHorus"
l_0_2["ehorus_kill.exe"] = "eHorus"
l_0_2["ehorus_cmd.exe"] = "eHorus"
l_0_2["ehorus_uit.exe"] = "eHorus"
l_0_2["fleetdeck_agent_svc.exe"] = "Fleetdeck"
l_0_2["g2ax_start.exe"] = "GoTo"
l_0_2["g2host.exe"] = "GoTo"
l_0_2["gotomypc.exe"] = "GoTo"
l_0_2["ammyyadmin.exe"] = "AmmyyAdmin"
l_0_2["pulseway.exe"] = "Pulseway"
l_0_2["rutserv.exe"] = "RemoteUtilities"
l_0_2["rfusclient.exe"] = "RemoteUtilities"
l_0_2["remotepchost.exe"] = "RemotePC"
l_0_2["level-windows-amd64.exe"] = "Level"
l_0_2["level-remote-control-ffmpeg.exe"] = "Level"
l_0_2["basupsrvc.exe"] = "NAble"
l_0_2["basupsrvccnfg.exe"] = "NAble"
l_0_2["basupclphlp.exe"] = "NAble"
l_0_2["basupsrvcupdater.exe"] = "NAble"
l_0_2["basupsysinf.exe"] = "NAble"
l_0_2["basuptshelper.exe"] = "NAble"
l_0_2["tcintegratorcommhelper.exe"] = "NAble"
l_0_2["tclauncherhelper.exe"] = "NAble"
l_0_2["fixme.client.exe"] = "FixMeIt"
l_0_2["remoting_host.exe"] = "ChromeRemoteDesktop"
l_0_2["remoting_desktop.exe"] = "ChromeRemoteDesktop"
l_0_2["remoting_native_messaging_host.exe"] = "ChromeRemoteDesktop"
l_0_2["remoting_assistance_host.exe"] = "ChromeRemoteDesktop"
l_0_2["domotz_agent.exe"] = "Domotz"
l_0_2["zerotier-one.exe"] = "ZeroTier"
l_0_2["superops.exe"] = "SuperOps"
l_0_2["rport.exe"] = "RPort"
l_0_2["itsmagent.exe"] = "ITarian"
l_0_2["rmmservice.exe"] = "ITarian"
l_0_2["agentlessrc.exe"] = "ITarian"
l_0_2["parsecd.exe"] = "Parsec"
l_0_2["poweradmin.exe"] = "PowerAdmin"
l_0_2["besclient.exe"] = "HCLBigFix"
l_0_2["asgremotedesktop.exe"] = "ASGRemoteDesktop"
l_0_2["aemagent.exe"] = "ManageEngineRMM"
l_0_2["dcagentservice.exe"] = "ManageEngineRMM"
l_0_2["xeox-agent.exe"] = "Xeox"
l_0_2["kausrtsk.exe"] = "KaseyaVSA"
l_0_2["agentmon.exe"] = "KaseyaVSA"
l_0_2["kaseyaremotecontrol.exe"] = "KaseyaVSA"
l_0_2["litemanager.exe"] = "LiteManager"
l_0_2["aeroadmin.exe"] = "AeroAdmin"
l_0_2["alpemix.exe"] = "Alpemix"
l_0_2["auvikservice.exe"] = "Auvik"
l_0_2["auvikagent.exe"] = "Auvik"
l_0_2["awesun.exe"] = "AweSun"
l_0_2["beamyourscreen.exe"] = "BeamYourScreen"
l_0_2["beamyourscreen-host.exe"] = "BeamYourScreen"
l_0_2["ericomrdp.exe"] = "Ericom"
l_0_2["fastviewer.exe"] = "FastViewer"
l_0_2["wfreerdp.exe"] = "FreeRDP"
l_0_2["nxplayer.exe"] = "NoMachine"
l_0_2["getscreen.exe"] = "GetScreen"
l_0_2["imperoclientsvc.exe"] = "Impero"
l_0_2["instanthousecall.exe"] = "InstantHouseCall"
l_0_2["jumpcloud-agent.exe"] = "JumpCloud"
l_0_2["jumpconnect.exe"] = "JumpDesktop"
l_0_2["jumpdesktopconnect.exe"] = "JumpDesktop"
l_0_2["jumpupdater.exe"] = "JumpDesktop"
l_0_2["jumpdesktopupdater.exe"] = "JumpDesktop"
l_0_2["jumpclient.exe"] = "JumpDesktop"
l_0_2["kabuto.app.runner.exe"] = "Kabuto"
l_0_2["kabuto.service.runner.exe"] = "Kabuto"
l_0_2["khelpdesk.exe"] = "Kabuto"
l_0_2["prlsvcctl.exe"] = "ParallelsAccess"
l_0_2["prl_deskctl_agent.exe"] = "ParallelsAccess"
l_0_2["prl_deskctl_wizard.exe"] = "ParallelsAccess"
l_0_2["pcvisit_service_client.exe"] = "PCVisit"
l_0_2["pcvisit_client.exe"] = "PCVisit"
l_0_2["oosysremotedesktopui.exe"] = "OOSys"
l_0_2["oosysagent.exe"] = "OOSys"
l_0_2["netbird.exe"] = "NetBird"
l_0_2["netbird-ui.exe"] = "NetBird"
l_0_2["tailscale.exe"] = "Tailscale"
l_0_2["tailscaled.exe"] = "Tailscale"
l_0_2["wireguard.exe"] = "WireGuard"
l_0_2["twingate.exe"] = "Twingate"
l_0_2["twingateservice.exe"] = "Twingate"
l_0_2["ngrok.exe"] = "Ngrok"
l_0_2["cloudflared.exe"] = "Cloudflared"
l_0_2["frpc.exe"] = "frp"
l_0_2["frps.exe"] = "frp"
l_0_2["chisel.exe"] = "Chisel"
l_0_2["ligolo.exe"] = "LigoloNg"
l_0_2["bore.exe"] = "Bore"
l_0_2["rpivot.exe"] = "RPivot"
l_0_2["iox.exe"] = "iox"
l_0_2["tsh.exe"] = "Teleport"
l_0_2["tctl.exe"] = "Teleport"
l_0_2["teleport.exe"] = "Teleport"
l_0_2["playit.exe"] = "Playit"
l_0_2["ltsvc.exe"] = "CWAutomate"
l_0_2["ltsvcmon.exe"] = "CWAutomate"
l_0_2["ltclient.exe"] = "CWAutomate"
l_0_2["ltupdate.exe"] = "CWAutomate"
l_0_2["dattormmagent.exe"] = "DattoRMM"
l_0_2["dattodesktopagent.exe"] = "DattoRMM"
l_0_2["zabbix_agentd.exe"] = "Zabbix"
l_0_2["zabbix_agent2.exe"] = "Zabbix"
l_0_2["ssh.exe"] = "OpenSSH"
l_0_2["sshd.exe"] = "OpenSSH"
l_0_2["ssh-agent.exe"] = "OpenSSH"
l_0_2["sftp.exe"] = "OpenSSH"
l_0_2["scp.exe"] = "OpenSSH"
l_0_2["putty.exe"] = "PuTTY"
l_0_2["plink.exe"] = "PuTTY"
l_0_2["puttygen.exe"] = "PuTTY"
l_0_2["pageant.exe"] = "PuTTY"
l_0_2["psftp.exe"] = "PuTTY"
local l_0_3 = "kitty.exe"
l_0_2[l_0_3] = "KiTTY"
l_0_3 = "kitty_portable.exe"
l_0_2[l_0_3] = "KiTTY"
l_0_3 = "winscp.exe"
l_0_2[l_0_3] = "WinSCP"
l_0_3 = "winscp5.exe"
l_0_2[l_0_3] = "WinSCP"
l_0_3 = "mstsc.exe"
l_0_2[l_0_3] = "MSTSC"
l_0_3 = "mremoteng.exe"
l_0_2[l_0_3] = "mRemoteNG"
l_0_3 = "rdpwrap.exe"
l_0_2[l_0_3] = "RDPWrapper"
l_0_3 = "rdpcheck.exe"
l_0_2[l_0_3] = "RDPWrapper"
l_0_3 = l_0_2[l_0_1]
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = ExtractDeviceProperties()
if l_0_4.DeviceRoles then
  local l_0_5 = "NewAnomaly_RMM"
  local l_0_6 = "NewRMMToolOnHVA.J"
  local l_0_7 = (MpCommon.AnomalyEventLookup)(l_0_5, "MarkerRecord_RMMAnomaly", 1)
  local l_0_8 = 0
  local l_0_9 = (MpCommon.GetCurrentTimeT)()
  local l_0_10 = l_0_9
  local l_0_11, l_0_12 = nil, nil
  local l_0_13 = {}
  l_0_13.TrackedProcess = l_0_1
  l_0_13.SignatureName = l_0_6
  l_0_13.AnomalyTableName = l_0_5
  l_0_13.Key = l_0_3
  if l_0_7 then
    local l_0_14 = "MarkerEntryType"
    l_0_13[l_0_14] = "MarkerFound"
    l_0_14 = "Count"
    l_0_14 = l_0_7[l_0_14]
    if l_0_14 then
      l_0_14 = "Count"
      l_0_10 = l_0_7[l_0_14]
    end
    l_0_14 = "LastSeen"
    l_0_8 = l_0_7[l_0_14]
  else
    do
      l_0_10 = l_0_9
      l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_5, "MarkerRecord_RMMAnomaly", l_0_9, 1)
      if not l_0_11 then
        l_0_13.Error = l_0_12
      end
      do
        local l_0_15 = "MarkerEntryType"
        l_0_13[l_0_15] = "MarkerCreated"
        local l_0_16 = (l_0_9 - l_0_10) / 60
        l_0_13.TableUnbiasedTime = l_0_16
        l_0_13.current_time = l_0_9
        l_0_13.marker_UnbiasedTime = l_0_10
        l_0_13.TableLastSeen = l_0_8
        local l_0_17 = (MpCommon.AnomalyEventLookup)(l_0_5, l_0_3, 1)
        if not l_0_17 then
          if 10080 < l_0_16 then
            local l_0_18 = "EntryType"
            l_0_13[l_0_18] = "AddedAfterThreshold"
            l_0_18 = mp
            l_0_18 = l_0_18.get_contextdata
            l_0_18 = l_0_18(mp.CONTEXT_DATA_PROCESS_PPID)
            if l_0_18 then
              local l_0_19 = pcall(MpCommon.QuerySessionInformation, l_0_18, MpCommon.WTSIsRemoteSession)
              do
                local l_0_20, l_0_21 = l_0_19 and MpCommon.QuerySessionInformation or "FALSE"
                local l_0_22 = nil
                l_0_13.isRemote = tostring(l_0_22)
                local l_0_23 = pcall(MpCommon.QuerySessionInformation, l_0_18, MpCommon.WTSDomainName)
                if l_0_23 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
                  local l_0_24 = nil
                  local l_0_25 = scrubData(R22_PC365)
                  l_0_13[R22_PC365] = tostring(l_0_25)
                end
                do
                  -- DECOMPILER ERROR at PC372: Overwrote pending register: R22 in 'AssignReg'

                  -- DECOMPILER ERROR at PC374: Overwrote pending register: R22 in 'AssignReg'

                  local l_0_26, l_0_27 = , pcall(R22_PC365, l_0_18, MpCommon.WTSUserName)
                  if l_0_27 and R22_PC365 and R22_PC365 ~= "" then
                    local l_0_28 = R22_PC365
                    local l_0_29 = scrubData(R24_PC388)
                    l_0_13[R24_PC388] = tostring(l_0_29)
                  end
                  do
                    -- DECOMPILER ERROR at PC395: Overwrote pending register: R24 in 'AssignReg'

                    -- DECOMPILER ERROR at PC397: Overwrote pending register: R24 in 'AssignReg'

                    local l_0_30, l_0_31 = l_0_28, pcall(R24_PC388, l_0_18, MpCommon.WTSClientAddress)
                    if l_0_31 and R24_PC388 and R24_PC388 ~= "" then
                      local l_0_32 = R24_PC388
                      local l_0_33 = scrubData(R26_PC411)
                      l_0_13[R26_PC411] = tostring(l_0_33)
                    end
                    do
                      -- DECOMPILER ERROR at PC418: Overwrote pending register: R26 in 'AssignReg'

                      -- DECOMPILER ERROR at PC420: Overwrote pending register: R26 in 'AssignReg'

                      local l_0_34, l_0_35 = l_0_32, pcall(R26_PC411, l_0_18, MpCommon.WTSClientName)
                      if l_0_35 and R26_PC411 and R26_PC411 ~= "" then
                        local l_0_36 = R26_PC411
                        local l_0_37 = scrubData(R28_PC434)
                        l_0_13[R28_PC434] = tostring(l_0_37)
                      end
                      do
                        local l_0_38 = l_0_36
                        -- DECOMPILER ERROR at PC441: Overwrote pending register: R28 in 'AssignReg'

                        R28_PC434 = R28_PC434(l_0_18, "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|", 2)
                        local l_0_39, l_0_40 = nil
                        if not l_0_40 or not l_0_18 then
                          local l_0_41 = nil
                          if ((mp.GetParentProcInfo)(l_0_18)) ~= nil then
                            local l_0_42 = nil
                            l_0_13.Parent = (string.lower)(l_0_42.image_path)
                          else
                            do
                              do
                                do
                                  local l_0_43 = nil
                                  l_0_13.Parent = "Untracked"
                                  -- DECOMPILER ERROR at PC472: Confused about usage of register: R29 in 'UnsetPending'

                                  l_0_13.Parent = l_0_41
                                  do
                                    local l_0_44 = "EntryType"
                                    l_0_13[l_0_44] = "NewTable"
                                    l_0_44 = MpCommon
                                    l_0_44 = l_0_44.AnomalyEventUpdate
                                    l_0_44(l_0_5, l_0_3, 1, 1)
                                    local l_0_45 = l_0_17.Count + 1
                                    do
                                      do
                                        local l_0_46 = "EntryType"
                                        l_0_13[l_0_46] = "NewKey"
                                        l_0_46 = MpCommon
                                        l_0_46 = l_0_46.AnomalyEventUpdate
                                        l_0_46(l_0_5, l_0_3, l_0_45, 1)
                                        set_research_data("RMM_Anomaly", safeJsonSerialize(l_0_13), false)
                                        do return mp.INFECTED end
                                        return mp.CLEAN
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

