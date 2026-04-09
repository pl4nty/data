-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELNewRMMToolOnHVAA\1.luac 

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
  local l_0_5 = "Anomaly_RMM"
  local l_0_6 = "NewRMMToolOnHVA.J"
  local l_0_7 = (MpCommon.AnomalyEventLookup)(l_0_5, "MarkerRecord_RMMAnomaly", 1)
  local l_0_8 = (MpCommon.GetCurrentTimeT)()
  local l_0_9 = l_0_8
  local l_0_10, l_0_11 = nil, nil
  local l_0_12 = {}
  l_0_12.TrackedProcess = l_0_1
  l_0_12.SignatureName = l_0_6
  l_0_12.AnomalyTableName = l_0_5
  l_0_12.Key = l_0_3
  if l_0_7 and l_0_7.Count then
    l_0_9 = l_0_7.Count
    local l_0_13 = "MarkerCount"
    l_0_12[l_0_13] = l_0_7.Count
    l_0_13 = "MarkerUnbiasedTime"
    l_0_12[l_0_13] = l_0_7.UnbiasedTime
    l_0_13 = "current_time"
    l_0_12[l_0_13] = l_0_8
    l_0_13 = l_0_8 - l_0_9
    l_0_13 = (l_0_13) / 60
    if 10080 < l_0_13 then
      local l_0_14 = "AnomalyTableInfo"
      l_0_12[l_0_14] = (MpCommon.AnomalyTableLookup)(l_0_5)
      l_0_14 = "EntryType"
      l_0_12[l_0_14] = "AddedAfterThreshold"
      l_0_14 = mp
      l_0_14 = l_0_14.get_contextdata
      l_0_14 = l_0_14(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_14 then
        local l_0_15 = pcall(MpCommon.QuerySessionInformation, l_0_14, MpCommon.WTSIsRemoteSession)
        do
          local l_0_16, l_0_17 = l_0_15 and MpCommon.QuerySessionInformation or "FALSE"
          local l_0_18 = nil
          l_0_12.isRemote = tostring(l_0_18)
          local l_0_19 = pcall(MpCommon.QuerySessionInformation, l_0_14, MpCommon.WTSDomainName)
          if l_0_19 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
            local l_0_20 = nil
            local l_0_21 = scrubData(R20_PC339)
            l_0_12[R20_PC339] = tostring(l_0_21)
          end
          do
            -- DECOMPILER ERROR at PC346: Overwrote pending register: R20 in 'AssignReg'

            -- DECOMPILER ERROR at PC348: Overwrote pending register: R20 in 'AssignReg'

            local l_0_22, l_0_23 = , pcall(R20_PC339, l_0_14, MpCommon.WTSUserName)
            if l_0_23 and R20_PC339 and R20_PC339 ~= "" then
              local l_0_24 = R20_PC339
              local l_0_25 = scrubData(R22_PC362)
              l_0_12[R22_PC362] = tostring(l_0_25)
            end
            do
              -- DECOMPILER ERROR at PC369: Overwrote pending register: R22 in 'AssignReg'

              -- DECOMPILER ERROR at PC371: Overwrote pending register: R22 in 'AssignReg'

              local l_0_26, l_0_27 = l_0_24, pcall(R22_PC362, l_0_14, MpCommon.WTSClientAddress)
              if l_0_27 and R22_PC362 and R22_PC362 ~= "" then
                local l_0_28 = R22_PC362
                local l_0_29 = scrubData(R24_PC385)
                l_0_12[R24_PC385] = tostring(l_0_29)
              end
              do
                -- DECOMPILER ERROR at PC392: Overwrote pending register: R24 in 'AssignReg'

                -- DECOMPILER ERROR at PC394: Overwrote pending register: R24 in 'AssignReg'

                local l_0_30, l_0_31 = l_0_28, pcall(R24_PC385, l_0_14, MpCommon.WTSClientName)
                if l_0_31 and R24_PC385 and R24_PC385 ~= "" then
                  local l_0_32 = R24_PC385
                  local l_0_33 = scrubData(R26_PC408)
                  l_0_12[R26_PC408] = tostring(l_0_33)
                end
                do
                  local l_0_34 = l_0_32
                  -- DECOMPILER ERROR at PC415: Overwrote pending register: R26 in 'AssignReg'

                  R26_PC408 = R26_PC408(l_0_14, "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|", 2)
                  local l_0_35, l_0_36 = nil
                  if not l_0_36 or not l_0_14 then
                    local l_0_37 = nil
                    if ((mp.GetParentProcInfo)(l_0_14)) ~= nil then
                      local l_0_38 = nil
                      l_0_12.Parent = (string.lower)(l_0_38.image_path)
                    else
                      do
                        do
                          do
                            do
                              local l_0_39 = nil
                              l_0_12.Parent = "Untracked"
                              -- DECOMPILER ERROR at PC446: Confused about usage of register: R27 in 'UnsetPending'

                              l_0_12.Parent = l_0_37
                              l_0_10 = pcall(MpCommon.AnomalyEventUpdate, l_0_5, l_0_3, 1, 1)
                              -- DECOMPILER ERROR at PC469: Overwrote pending register: R11 in 'AssignReg'

                              l_0_10 = pcall(MpCommon.AnomalyEventUpdate, l_0_5, "MarkerRecord_RMMAnomaly", 1, 1)
                              -- DECOMPILER ERROR at PC482: Overwrote pending register: R11 in 'AssignReg'

                              if l_0_10 then
                                l_0_10 = pcall(MpCommon.AnomalyEventUpdate, l_0_5, l_0_3, 1, 1)
                                local l_0_40 = "EntryType"
                                l_0_12[l_0_40] = "NewMarkerAndEntry"
                              end
                              do
                                do
                                  if not l_0_10 then
                                    l_0_12.Error = l_0_11
                                  end
                                  set_research_data("RMM_Anomaly", safeJsonSerialize(l_0_12), false)
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

