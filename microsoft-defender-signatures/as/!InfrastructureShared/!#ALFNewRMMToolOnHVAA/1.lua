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
local l_0_2 = IsDeviceHVAWithAD()
if l_0_2 ~= true then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3["anydesk.exe"] = "AnyDesk"
l_0_3["screenconnect.clientservice.exe"] = "ScreenConnect"
l_0_3["screenconnect.windowsclient.exe"] = "ScreenConnect"
l_0_3["ctespersistence.exe"] = "ScreenConnect"
l_0_3["cteshostsvc.exe"] = "ScreenConnect"
l_0_3["cagservice.exe"] = "ScreenConnect"
l_0_3["screenconnect.client.exe"] = "ScreenConnect"
l_0_3["teamviewer.exe"] = "TeamViewer"
l_0_3["teamviewer_service.exe"] = "TeamViewer"
l_0_3["tv_w32.exe"] = "TeamViewer"
l_0_3["tv_x64.exe"] = "TeamViewer"
l_0_3["teamviewerqs.exe"] = "TeamViewer"
l_0_3["splashtop.exe"] = "Splashtop"
l_0_3["srstreamer.exe"] = "Splashtop"
l_0_3["splashtop_streamer.exe"] = "Splashtop"
l_0_3["splashtopsrservice.exe"] = "Splashtop"
l_0_3["ateraagent.exe"] = "Atera"
l_0_3["logmein.exe"] = "LogMeIn"
l_0_3["lmiguardiansvc.exe"] = "LogMeIn"
l_0_3["lmirescue.exe"] = "LogMeIn"
l_0_3["client32.exe"] = "NetSupport"
l_0_3["pcictlui.exe"] = "NetSupport"
l_0_3["client64.exe"] = "NetSupport"
l_0_3["netsupport.exe"] = "NetSupport"
l_0_3["elev_win.exe"] = "NetSupport"
l_0_3["srmanager.exe"] = "NetSupport"
l_0_3["action1_agent.exe"] = "Action1"
l_0_3["action1_remote.exe"] = "Action1"
l_0_3["action1agent.exe"] = "Action1"
l_0_3["meshagent.exe"] = "MeshAgent"
l_0_3["meshcentral.exe"] = "MeshCentral"
l_0_3["rustdesk.exe"] = "RustDesk"
l_0_3["hoptodesktop.exe"] = "HopToDesk"
l_0_3["mobaxterm.exe"] = "MobaXterm"
l_0_3["tvnserver.exe"] = "TightVNC"
l_0_3["tvnviewer.exe"] = "TightVNC"
l_0_3["vncserverui.exe"] = "VNC"
l_0_3["vncviewer.exe"] = "VNC"
l_0_3["winvnc4.exe"] = "VNC"
l_0_3["vncserver.exe"] = "VNC"
l_0_3["vncconfig.exe"] = "VNC"
l_0_3["vncaddrbook.exe"] = "VNC"
l_0_3["winvnc.exe"] = "VNC"
l_0_3["ultravnc.exe"] = "UltraVNC"
l_0_3["radmin.exe"] = "Radmin"
l_0_3["rserver3.exe"] = "Radmin"
l_0_3["rpcviewerui.exe"] = "Radmin"
l_0_3["simplehelp.exe"] = "SimpleHelp"
l_0_3["simpleservice.exe"] = "SimpleHelp"
l_0_3["zohoassist.exe"] = "ZohoAssist"
l_0_3["zaservice.exe"] = "ZohoAssist"
l_0_3["zohomeeting.exe"] = "ZohoMeeting"
l_0_3["ninjarmmagent.exe"] = "NinjaOne"
l_0_3["ninjaremote.exe"] = "NinjaOne"
l_0_3["ninjapatcher.exe"] = "NinjaOne"
l_0_3["ninjarmm-agent.exe"] = "NinjaOne"
l_0_3["tacticalrmm.exe"] = "TacticalRMM"
l_0_3["pdqdeploy.exe"] = "PDQDeploy"
l_0_3["pdqdeployconsole.exe"] = "PDQDeploy"
l_0_3["pdqrunner.exe"] = "PDQDeploy"
l_0_3["pdqinventoryconsole.exe"] = "PDQDeploy"
l_0_3["pdqinventoryscanner.exe"] = "PDQDeploy"
l_0_3["pdqdeployrunner.exe"] = "PDQDeploy"
l_0_3["supremo.exe"] = "Supremo"
l_0_3["supremoservice.exe"] = "Supremo"
l_0_3["syncromsp.exe"] = "Syncro"
l_0_3["sorillus.exe"] = "Sorillus"
l_0_3["dwagent.exe"] = "DWAgent"
l_0_3["dwagsvc.exe"] = "DWAgent"
l_0_3["ehorus_agent.exe"] = "eHorus"
l_0_3["ehorus_tray.exe"] = "eHorus"
l_0_3["ehorus_kill.exe"] = "eHorus"
l_0_3["ehorus_cmd.exe"] = "eHorus"
l_0_3["ehorus_uit.exe"] = "eHorus"
l_0_3["fleetdeck_agent_svc.exe"] = "Fleetdeck"
l_0_3["g2ax_start.exe"] = "GoTo"
l_0_3["g2host.exe"] = "GoTo"
l_0_3["gotomypc.exe"] = "GoTo"
l_0_3["gotoresolve.exe"] = "GoTo"
l_0_3["ammyyadmin.exe"] = "AmmyyAdmin"
l_0_3["ammyy_admin.exe"] = "AmmyyAdmin"
l_0_3["showmypc.exe"] = "ShowMyPC"
l_0_3["anyviewer.exe"] = "AnyViewer"
l_0_3["pulseway.exe"] = "Pulseway"
l_0_3["rutserv.exe"] = "RemoteUtilities"
l_0_3["rfusclient.exe"] = "RemoteUtilities"
l_0_3["remotepchost.exe"] = "RemotePC"
l_0_3["level-windows-amd64.exe"] = "Level"
l_0_3["level-remote-control-ffmpeg.exe"] = "Level"
l_0_3["basupsrvc.exe"] = "NAble"
l_0_3["basupsrvccnfg.exe"] = "NAble"
l_0_3["basupclphlp.exe"] = "NAble"
l_0_3["basupsrvcupdater.exe"] = "NAble"
l_0_3["basupsysinf.exe"] = "NAble"
l_0_3["basuptshelper.exe"] = "NAble"
l_0_3["tcintegratorcommhelper.exe"] = "NAble"
l_0_3["tclauncherhelper.exe"] = "NAble"
l_0_3["nagent.exe"] = "NAble"
l_0_3["maxagentservice.exe"] = "NAble"
l_0_3["fixme.client.exe"] = "FixMeIt"
l_0_3["remoting_host.exe"] = "ChromeRemoteDesktop"
l_0_3["remoting_desktop.exe"] = "ChromeRemoteDesktop"
l_0_3["remoting_native_messaging_host.exe"] = "ChromeRemoteDesktop"
l_0_3["remoting_assistance_host.exe"] = "ChromeRemoteDesktop"
l_0_3["domotz_agent.exe"] = "Domotz"
l_0_3["zerotier-one.exe"] = "ZeroTier"
l_0_3["superops.exe"] = "SuperOps"
l_0_3["itsplatform.exe"] = "ITSPlatform"
l_0_3["rport.exe"] = "RPort"
l_0_3["itsmagent.exe"] = "ITarian"
l_0_3["rmmservice.exe"] = "ITarian"
l_0_3["agentlessrc.exe"] = "ITarian"
l_0_3["parsecd.exe"] = "Parsec"
l_0_3["poweradmin.exe"] = "PowerAdmin"
l_0_3["besclient.exe"] = "HCLBigFix"
l_0_3["asgremotedesktop.exe"] = "ASGRemoteDesktop"
l_0_3["bomgar-scc.exe"] = "BeyondTrust"
l_0_3["bomgar-jpt.exe"] = "BeyondTrust"
l_0_3["tsservice.exe"] = "BeyondTrust"
l_0_3["dwrcs.exe"] = "DameWare"
l_0_3["dwrcc.exe"] = "DameWare"
l_0_3["govlauncher.exe"] = "Goverlan"
l_0_3["govagent.exe"] = "Goverlan"
l_0_3["remotedesktopmanager.exe"] = "DevolutionsRDM"
l_0_3["remotedesktopmanager64.exe"] = "DevolutionsRDM"
l_0_3["iperiusremote.exe"] = "IperiusRemote"
l_0_3["aemagent.exe"] = "ManageEngineRMM"
l_0_3["dcagentservice.exe"] = "ManageEngineRMM"
l_0_3["xeox-agent.exe"] = "Xeox"
l_0_3["kausrtsk.exe"] = "KaseyaVSA"
l_0_3["agentmon.exe"] = "KaseyaVSA"
l_0_3["kaseyaremotecontrol.exe"] = "KaseyaVSA"
l_0_3["litemanager.exe"] = "LiteManager"
l_0_3["aeroadmin.exe"] = "AeroAdmin"
l_0_3["alpemix.exe"] = "Alpemix"
l_0_3["auvikservice.exe"] = "Auvik"
l_0_3["auvikagent.exe"] = "Auvik"
l_0_3["awesun.exe"] = "AweSun"
l_0_3["beamyourscreen.exe"] = "BeamYourScreen"
l_0_3["beamyourscreen-host.exe"] = "BeamYourScreen"
l_0_3["ericomrdp.exe"] = "Ericom"
l_0_3["fastviewer.exe"] = "FastViewer"
l_0_3["wfreerdp.exe"] = "FreeRDP"
l_0_3["nxplayer.exe"] = "NoMachine"
l_0_3["getscreen.exe"] = "GetScreen"
l_0_3["imperoclientsvc.exe"] = "Impero"
l_0_3["instanthousecall.exe"] = "InstantHouseCall"
l_0_3["jumpcloud-agent.exe"] = "JumpCloud"
l_0_3["jumpconnect.exe"] = "JumpDesktop"
l_0_3["jumpdesktopconnect.exe"] = "JumpDesktop"
l_0_3["jumpupdater.exe"] = "JumpDesktop"
l_0_3["jumpdesktopupdater.exe"] = "JumpDesktop"
l_0_3["jumpclient.exe"] = "JumpDesktop"
l_0_3["kabuto.app.runner.exe"] = "Kabuto"
l_0_3["kabuto.service.runner.exe"] = "Kabuto"
l_0_3["khelpdesk.exe"] = "Kabuto"
l_0_3["prlsvcctl.exe"] = "ParallelsAccess"
l_0_3["prl_deskctl_agent.exe"] = "ParallelsAccess"
l_0_3["prl_deskctl_wizard.exe"] = "ParallelsAccess"
l_0_3["pcvisit_service_client.exe"] = "PCVisit"
l_0_3["pcvisit_client.exe"] = "PCVisit"
l_0_3["oosysremotedesktopui.exe"] = "OOSys"
l_0_3["oosysagent.exe"] = "OOSys"
l_0_3["netbird.exe"] = "NetBird"
l_0_3["netbird-ui.exe"] = "NetBird"
local l_0_4 = "tailscale.exe"
l_0_3[l_0_4] = "Tailscale"
l_0_4 = "tailscaled.exe"
l_0_3[l_0_4] = "Tailscale"
l_0_4 = "wireguard.exe"
l_0_3[l_0_4] = "WireGuard"
l_0_4 = "twingate.exe"
l_0_3[l_0_4] = "Twingate"
l_0_4 = "twingateservice.exe"
l_0_3[l_0_4] = "Twingate"
l_0_4 = "ngrok.exe"
l_0_3[l_0_4] = "Ngrok"
l_0_4 = "socketxp.exe"
l_0_3[l_0_4] = "SocketXP"
l_0_4 = "cloudflared.exe"
l_0_3[l_0_4] = "Cloudflared"
l_0_4 = "frpc.exe"
l_0_3[l_0_4] = "frp"
l_0_4 = "frps.exe"
l_0_3[l_0_4] = "frp"
l_0_4 = "chisel.exe"
l_0_3[l_0_4] = "Chisel"
l_0_4 = "ligolo.exe"
l_0_3[l_0_4] = "LigoloNg"
l_0_4 = "bore.exe"
l_0_3[l_0_4] = "Bore"
l_0_4 = "rpivot.exe"
l_0_3[l_0_4] = "RPivot"
l_0_4 = "iox.exe"
l_0_3[l_0_4] = "iox"
l_0_4 = "tsh.exe"
l_0_3[l_0_4] = "Teleport"
l_0_4 = "tctl.exe"
l_0_3[l_0_4] = "Teleport"
l_0_4 = "teleport.exe"
l_0_3[l_0_4] = "Teleport"
l_0_4 = "playit.exe"
l_0_3[l_0_4] = "Playit"
l_0_4 = "ltsvc.exe"
l_0_3[l_0_4] = "CWAutomate"
l_0_4 = "ltsvcmon.exe"
l_0_3[l_0_4] = "CWAutomate"
l_0_4 = "ltclient.exe"
l_0_3[l_0_4] = "CWAutomate"
l_0_4 = "ltupdate.exe"
l_0_3[l_0_4] = "CWAutomate"
l_0_4 = "ltagent.exe"
l_0_3[l_0_4] = "CWAutomate"
l_0_4 = "dattormmagent.exe"
l_0_3[l_0_4] = "DattoRMM"
l_0_4 = "dattodesktopagent.exe"
l_0_3[l_0_4] = "DattoRMM"
l_0_4 = "sunloginclient.exe"
l_0_3[l_0_4] = "Sunlogin"
l_0_4 = "sunloginclient_service.exe"
l_0_3[l_0_4] = "Sunlogin"
l_0_4 = "todesk.exe"
l_0_3[l_0_4] = "ToDeSK"
l_0_4 = "todesk_service.exe"
l_0_3[l_0_4] = "ToDeSK"
l_0_4 = "zabbix_agentd.exe"
l_0_3[l_0_4] = "Zabbix"
l_0_4 = "zabbix_agent2.exe"
l_0_3[l_0_4] = "Zabbix"
l_0_4 = "velociraptor.exe"
l_0_3[l_0_4] = "Velociraptor"
l_0_4 = "ssh.exe"
l_0_3[l_0_4] = "OpenSSH"
l_0_4 = "sshd.exe"
l_0_3[l_0_4] = "OpenSSH"
l_0_4 = "ssh-agent.exe"
l_0_3[l_0_4] = "OpenSSH"
l_0_4 = "sftp.exe"
l_0_3[l_0_4] = "OpenSSH"
l_0_4 = "scp.exe"
l_0_3[l_0_4] = "OpenSSH"
l_0_4 = "putty.exe"
l_0_3[l_0_4] = "PuTTY"
l_0_4 = "plink.exe"
l_0_3[l_0_4] = "PuTTY"
l_0_4 = "puttygen.exe"
l_0_3[l_0_4] = "PuTTY"
l_0_4 = "pageant.exe"
l_0_3[l_0_4] = "PuTTY"
l_0_4 = "psftp.exe"
l_0_3[l_0_4] = "PuTTY"
l_0_4 = "bvssh.exe"
l_0_3[l_0_4] = "BitviseSSH"
l_0_4 = "securecrt.exe"
l_0_3[l_0_4] = "SecureCRT"
l_0_4 = "xshell.exe"
l_0_3[l_0_4] = "XShell"
l_0_4 = "proxifier.exe"
l_0_3[l_0_4] = "Proxifier"
l_0_4 = "kitty.exe"
l_0_3[l_0_4] = "KiTTY"
l_0_4 = "kitty_portable.exe"
l_0_3[l_0_4] = "KiTTY"
l_0_4 = "winscp.exe"
l_0_3[l_0_4] = "WinSCP"
l_0_4 = "winscp5.exe"
l_0_3[l_0_4] = "WinSCP"
l_0_4 = "mstsc.exe"
l_0_3[l_0_4] = "MSTSC"
l_0_4 = "quickassist.exe"
l_0_3[l_0_4] = "QuickAssist"
l_0_4 = "isllightclient.exe"
l_0_3[l_0_4] = "ISLOnline"
l_0_4 = "isllight.exe"
l_0_3[l_0_4] = "ISLOnline"
l_0_4 = "islalwayson.exe"
l_0_3[l_0_4] = "ISLOnline"
l_0_4 = "wayk-now.exe"
l_0_3[l_0_4] = "DevolutionsWayk"
l_0_4 = "remotedesktopplus.exe"
l_0_3[l_0_4] = "RemoteDesktopPlus"
l_0_4 = "mremoteng.exe"
l_0_3[l_0_4] = "mRemoteNG"
l_0_4 = "rdpwrap.exe"
l_0_3[l_0_4] = "RDPWrapper"
l_0_4 = "rdpcheck.exe"
l_0_3[l_0_4] = "RDPWrapper"
l_0_4 = "rmm.agent.exe"
l_0_3[l_0_4] = "RMMAgent"
l_0_4 = "rmm.agent.launcher.exe"
l_0_3[l_0_4] = "RMMAgent"
l_0_4 = l_0_3[l_0_1]
if l_0_4 == nil then
  return mp.CLEAN
end
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
l_0_13.Key = l_0_4
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
      local l_0_17 = (MpCommon.AnomalyEventLookup)(l_0_5, l_0_4, 1)
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
                local l_0_25 = scrubData(R22_PC526)
                l_0_13[R22_PC526] = tostring(l_0_25)
              end
              do
                -- DECOMPILER ERROR at PC533: Overwrote pending register: R22 in 'AssignReg'

                -- DECOMPILER ERROR at PC535: Overwrote pending register: R22 in 'AssignReg'

                local l_0_26, l_0_27 = , pcall(R22_PC526, l_0_18, MpCommon.WTSUserName)
                if l_0_27 and R22_PC526 and R22_PC526 ~= "" then
                  local l_0_28 = R22_PC526
                  local l_0_29 = scrubData(R24_PC549)
                  l_0_13[R24_PC549] = tostring(l_0_29)
                end
                do
                  -- DECOMPILER ERROR at PC556: Overwrote pending register: R24 in 'AssignReg'

                  -- DECOMPILER ERROR at PC558: Overwrote pending register: R24 in 'AssignReg'

                  local l_0_30, l_0_31 = l_0_28, pcall(R24_PC549, l_0_18, MpCommon.WTSClientAddress)
                  if l_0_31 and R24_PC549 and R24_PC549 ~= "" then
                    local l_0_32 = R24_PC549
                    local l_0_33 = scrubData(R26_PC572)
                    l_0_13[R26_PC572] = tostring(l_0_33)
                  end
                  do
                    -- DECOMPILER ERROR at PC579: Overwrote pending register: R26 in 'AssignReg'

                    -- DECOMPILER ERROR at PC581: Overwrote pending register: R26 in 'AssignReg'

                    local l_0_34, l_0_35 = l_0_32, pcall(R26_PC572, l_0_18, MpCommon.WTSClientName)
                    if l_0_35 and R26_PC572 and R26_PC572 ~= "" then
                      local l_0_36 = R26_PC572
                      local l_0_37 = scrubData(R28_PC595)
                      l_0_13[R28_PC595] = tostring(l_0_37)
                    end
                    do
                      local l_0_38 = l_0_36
                      -- DECOMPILER ERROR at PC602: Overwrote pending register: R28 in 'AssignReg'

                      R28_PC595 = R28_PC595(l_0_18, "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|", 2)
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
                                do
                                  local l_0_43 = nil
                                  l_0_13.Parent = "Untracked"
                                  -- DECOMPILER ERROR at PC633: Confused about usage of register: R29 in 'UnsetPending'

                                  l_0_13.Parent = l_0_41
                                  set_research_data("RMM_Anomaly", safeJsonSerialize(l_0_13), false)
                                  do return mp.INFECTED end
                                  do
                                    local l_0_44 = "EntryType"
                                    l_0_13[l_0_44] = "NewTable"
                                    l_0_44 = MpCommon
                                    l_0_44 = l_0_44.AnomalyEventUpdate
                                    l_0_44(l_0_5, l_0_4, 1, 1)
                                    local l_0_45 = l_0_17.Count + 1
                                    do
                                      local l_0_46 = "EntryType"
                                      l_0_13[l_0_46] = "NewKey"
                                      l_0_46 = MpCommon
                                      l_0_46 = l_0_46.AnomalyEventUpdate
                                      l_0_46(l_0_5, l_0_4, l_0_45, 1)
                                      l_0_46 = set_research_data
                                      l_0_46("RMM_Anomaly", safeJsonSerialize(l_0_13), false)
                                      l_0_46 = mp
                                      l_0_46 = l_0_46.set_mpattribute
                                      l_0_46("Lua:RMMAnomalyNewKey")
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

