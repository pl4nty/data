-- Threat: !InfrastructureShared
-- Name: !#ALF:NewRMMToolOnHVA.A
-- Type: 11
-- Includes: ResearchData, LuaFuncHelper, HvaLookupHelpers, BMLuaLib, TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = IsDeviceHVAWithAD()
if l_0_2 ~= true then
  return mp.CLEAN
end
local l_0_3 = {
  ["anydesk.exe"] = "AnyDesk",
  ["screenconnect.clientservice.exe"] = "ScreenConnect",
  ["screenconnect.windowsclient.exe"] = "ScreenConnect",
  ["ctespersistence.exe"] = "ScreenConnect",
  ["cteshostsvc.exe"] = "ScreenConnect",
  ["cagservice.exe"] = "ScreenConnect",
  ["screenconnect.client.exe"] = "ScreenConnect",
  ["teamviewer.exe"] = "TeamViewer",
  ["teamviewer_service.exe"] = "TeamViewer",
  ["tv_w32.exe"] = "TeamViewer",
  ["tv_x64.exe"] = "TeamViewer",
  ["teamviewerqs.exe"] = "TeamViewer",
  ["splashtop.exe"] = "Splashtop",
  ["srstreamer.exe"] = "Splashtop",
  ["splashtop_streamer.exe"] = "Splashtop",
  ["splashtopsrservice.exe"] = "Splashtop",
  ["ateraagent.exe"] = "Atera",
  ["logmein.exe"] = "LogMeIn",
  ["lmiguardiansvc.exe"] = "LogMeIn",
  ["lmirescue.exe"] = "LogMeIn",
  ["client32.exe"] = "NetSupport",
  ["pcictlui.exe"] = "NetSupport",
  ["client64.exe"] = "NetSupport",
  ["netsupport.exe"] = "NetSupport",
  ["elev_win.exe"] = "NetSupport",
  ["srmanager.exe"] = "NetSupport",
  ["action1_agent.exe"] = "Action1",
  ["action1_remote.exe"] = "Action1",
  ["action1agent.exe"] = "Action1",
  ["meshagent.exe"] = "MeshAgent",
  ["meshcentral.exe"] = "MeshCentral",
  ["rustdesk.exe"] = "RustDesk",
  ["hoptodesktop.exe"] = "HopToDesk",
  ["mobaxterm.exe"] = "MobaXterm",
  ["tvnserver.exe"] = "TightVNC",
  ["tvnviewer.exe"] = "TightVNC",
  ["vncserverui.exe"] = "VNC",
  ["vncviewer.exe"] = "VNC",
  ["winvnc4.exe"] = "VNC",
  ["vncserver.exe"] = "VNC",
  ["vncconfig.exe"] = "VNC",
  ["vncaddrbook.exe"] = "VNC",
  ["winvnc.exe"] = "VNC",
  ["ultravnc.exe"] = "UltraVNC",
  ["radmin.exe"] = "Radmin",
  ["rserver3.exe"] = "Radmin",
  ["rpcviewerui.exe"] = "Radmin",
  ["simplehelp.exe"] = "SimpleHelp",
  ["simpleservice.exe"] = "SimpleHelp",
  ["zohoassist.exe"] = "ZohoAssist",
  ["zaservice.exe"] = "ZohoAssist",
  ["zohomeeting.exe"] = "ZohoMeeting",
  ["ninjarmmagent.exe"] = "NinjaOne",
  ["ninjaremote.exe"] = "NinjaOne",
  ["ninjapatcher.exe"] = "NinjaOne",
  ["ninjarmm-agent.exe"] = "NinjaOne",
  ["tacticalrmm.exe"] = "TacticalRMM",
  ["pdqdeploy.exe"] = "PDQDeploy",
  ["pdqdeployconsole.exe"] = "PDQDeploy",
  ["pdqrunner.exe"] = "PDQDeploy",
  ["pdqinventoryconsole.exe"] = "PDQDeploy",
  ["pdqinventoryscanner.exe"] = "PDQDeploy",
  ["pdqdeployrunner.exe"] = "PDQDeploy",
  ["supremo.exe"] = "Supremo",
  ["supremoservice.exe"] = "Supremo",
  ["syncromsp.exe"] = "Syncro",
  ["sorillus.exe"] = "Sorillus",
  ["dwagent.exe"] = "DWAgent",
  ["dwagsvc.exe"] = "DWAgent",
  ["ehorus_agent.exe"] = "eHorus",
  ["ehorus_tray.exe"] = "eHorus",
  ["ehorus_kill.exe"] = "eHorus",
  ["ehorus_cmd.exe"] = "eHorus",
  ["ehorus_uit.exe"] = "eHorus",
  ["fleetdeck_agent_svc.exe"] = "Fleetdeck",
  ["g2ax_start.exe"] = "GoTo",
  ["g2host.exe"] = "GoTo",
  ["gotomypc.exe"] = "GoTo",
  ["gotoresolve.exe"] = "GoTo",
  ["ammyyadmin.exe"] = "AmmyyAdmin",
  ["ammyy_admin.exe"] = "AmmyyAdmin",
  ["showmypc.exe"] = "ShowMyPC",
  ["anyviewer.exe"] = "AnyViewer",
  ["pulseway.exe"] = "Pulseway",
  ["rutserv.exe"] = "RemoteUtilities",
  ["rfusclient.exe"] = "RemoteUtilities",
  ["remotepchost.exe"] = "RemotePC",
  ["level-windows-amd64.exe"] = "Level",
  ["level-remote-control-ffmpeg.exe"] = "Level",
  ["basupsrvc.exe"] = "NAble",
  ["basupsrvccnfg.exe"] = "NAble",
  ["basupclphlp.exe"] = "NAble",
  ["basupsrvcupdater.exe"] = "NAble",
  ["basupsysinf.exe"] = "NAble",
  ["basuptshelper.exe"] = "NAble",
  ["tcintegratorcommhelper.exe"] = "NAble",
  ["tclauncherhelper.exe"] = "NAble",
  ["nagent.exe"] = "NAble",
  ["maxagentservice.exe"] = "NAble",
  ["fixme.client.exe"] = "FixMeIt",
  ["remoting_host.exe"] = "ChromeRemoteDesktop",
  ["remoting_desktop.exe"] = "ChromeRemoteDesktop",
  ["remoting_native_messaging_host.exe"] = "ChromeRemoteDesktop",
  ["remoting_assistance_host.exe"] = "ChromeRemoteDesktop",
  ["domotz_agent.exe"] = "Domotz",
  ["zerotier-one.exe"] = "ZeroTier",
  ["superops.exe"] = "SuperOps",
  ["itsplatform.exe"] = "ITSPlatform",
  ["rport.exe"] = "RPort",
  ["itsmagent.exe"] = "ITarian",
  ["rmmservice.exe"] = "ITarian",
  ["agentlessrc.exe"] = "ITarian",
  ["parsecd.exe"] = "Parsec",
  ["poweradmin.exe"] = "PowerAdmin",
  ["besclient.exe"] = "HCLBigFix",
  ["asgremotedesktop.exe"] = "ASGRemoteDesktop",
  ["bomgar-scc.exe"] = "BeyondTrust",
  ["bomgar-jpt.exe"] = "BeyondTrust",
  ["tsservice.exe"] = "BeyondTrust",
  ["dwrcs.exe"] = "DameWare",
  ["dwrcc.exe"] = "DameWare",
  ["govlauncher.exe"] = "Goverlan",
  ["govagent.exe"] = "Goverlan",
  ["remotedesktopmanager.exe"] = "DevolutionsRDM",
  ["remotedesktopmanager64.exe"] = "DevolutionsRDM",
  ["iperiusremote.exe"] = "IperiusRemote",
  ["aemagent.exe"] = "ManageEngineRMM",
  ["dcagentservice.exe"] = "ManageEngineRMM",
  ["xeox-agent.exe"] = "Xeox",
  ["kausrtsk.exe"] = "KaseyaVSA",
  ["agentmon.exe"] = "KaseyaVSA",
  ["kaseyaremotecontrol.exe"] = "KaseyaVSA",
  ["litemanager.exe"] = "LiteManager",
  ["aeroadmin.exe"] = "AeroAdmin",
  ["alpemix.exe"] = "Alpemix",
  ["auvikservice.exe"] = "Auvik",
  ["auvikagent.exe"] = "Auvik",
  ["awesun.exe"] = "AweSun",
  ["beamyourscreen.exe"] = "BeamYourScreen",
  ["beamyourscreen-host.exe"] = "BeamYourScreen",
  ["ericomrdp.exe"] = "Ericom",
  ["fastviewer.exe"] = "FastViewer",
  ["wfreerdp.exe"] = "FreeRDP",
  ["nxplayer.exe"] = "NoMachine",
  ["getscreen.exe"] = "GetScreen",
  ["imperoclientsvc.exe"] = "Impero",
  ["instanthousecall.exe"] = "InstantHouseCall",
  ["jumpcloud-agent.exe"] = "JumpCloud",
  ["jumpconnect.exe"] = "JumpDesktop",
  ["jumpdesktopconnect.exe"] = "JumpDesktop",
  ["jumpupdater.exe"] = "JumpDesktop",
  ["jumpdesktopupdater.exe"] = "JumpDesktop",
  ["jumpclient.exe"] = "JumpDesktop",
  ["kabuto.app.runner.exe"] = "Kabuto",
  ["kabuto.service.runner.exe"] = "Kabuto",
  ["khelpdesk.exe"] = "Kabuto",
  ["prlsvcctl.exe"] = "ParallelsAccess",
  ["prl_deskctl_agent.exe"] = "ParallelsAccess",
  ["prl_deskctl_wizard.exe"] = "ParallelsAccess",
  ["pcvisit_service_client.exe"] = "PCVisit",
  ["pcvisit_client.exe"] = "PCVisit",
  ["oosysremotedesktopui.exe"] = "OOSys",
  ["oosysagent.exe"] = "OOSys",
  ["netbird.exe"] = "NetBird",
  ["netbird-ui.exe"] = "NetBird",
  ["tailscale.exe"] = "Tailscale",
  ["tailscaled.exe"] = "Tailscale",
  ["wireguard.exe"] = "WireGuard",
  ["twingate.exe"] = "Twingate",
  ["twingateservice.exe"] = "Twingate",
  ["ngrok.exe"] = "Ngrok",
  ["socketxp.exe"] = "SocketXP",
  ["cloudflared.exe"] = "Cloudflared",
  ["frpc.exe"] = "frp",
  ["frps.exe"] = "frp",
  ["chisel.exe"] = "Chisel",
  ["ligolo.exe"] = "LigoloNg",
  ["bore.exe"] = "Bore",
  ["rpivot.exe"] = "RPivot",
  ["iox.exe"] = "iox",
  ["tsh.exe"] = "Teleport",
  ["tctl.exe"] = "Teleport",
  ["teleport.exe"] = "Teleport",
  ["playit.exe"] = "Playit",
  ["ltsvc.exe"] = "CWAutomate",
  ["ltsvcmon.exe"] = "CWAutomate",
  ["ltclient.exe"] = "CWAutomate",
  ["ltupdate.exe"] = "CWAutomate",
  ["ltagent.exe"] = "CWAutomate",
  ["dattormmagent.exe"] = "DattoRMM",
  ["dattodesktopagent.exe"] = "DattoRMM",
  ["sunloginclient.exe"] = "Sunlogin",
  ["sunloginclient_service.exe"] = "Sunlogin",
  ["todesk.exe"] = "ToDeSK",
  ["todesk_service.exe"] = "ToDeSK",
  ["zabbix_agentd.exe"] = "Zabbix",
  ["zabbix_agent2.exe"] = "Zabbix",
  ["velociraptor.exe"] = "Velociraptor",
  ["ssh.exe"] = "OpenSSH",
  ["sshd.exe"] = "OpenSSH",
  ["ssh-agent.exe"] = "OpenSSH",
  ["sftp.exe"] = "OpenSSH",
  ["scp.exe"] = "OpenSSH",
  ["putty.exe"] = "PuTTY",
  ["plink.exe"] = "PuTTY",
  ["puttygen.exe"] = "PuTTY",
  ["pageant.exe"] = "PuTTY",
  ["psftp.exe"] = "PuTTY",
  ["bvssh.exe"] = "BitviseSSH",
  ["securecrt.exe"] = "SecureCRT",
  ["xshell.exe"] = "XShell",
  ["proxifier.exe"] = "Proxifier",
  ["kitty.exe"] = "KiTTY",
  ["kitty_portable.exe"] = "KiTTY",
  ["winscp.exe"] = "WinSCP",
  ["winscp5.exe"] = "WinSCP",
  ["mstsc.exe"] = "MSTSC",
  ["quickassist.exe"] = "QuickAssist",
  ["isllightclient.exe"] = "ISLOnline",
  ["isllight.exe"] = "ISLOnline",
  ["islalwayson.exe"] = "ISLOnline",
  ["wayk-now.exe"] = "DevolutionsWayk",
  ["remotedesktopplus.exe"] = "RemoteDesktopPlus",
  ["mremoteng.exe"] = "mRemoteNG",
  ["rdpwrap.exe"] = "RDPWrapper",
  ["rdpcheck.exe"] = "RDPWrapper",
  ["rmm.agent.exe"] = "RMMAgent",
  ["rmm.agent.launcher.exe"] = "RMMAgent"
}
local l_0_4 = l_0_3[l_0_1]
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = "NewAnomaly_RMM"
local l_0_6 = "NewRMMToolOnHVA.J"
local l_0_7 = MpCommon.AnomalyEventLookup(l_0_5, "MarkerRecord_RMMAnomaly", 1)
local l_0_8 = 0
local l_0_9 = MpCommon.GetCurrentTimeT()
local l_0_10 = l_0_9
local l_0_11, l_0_12
local l_0_13 = {}
l_0_13.TrackedProcess = l_0_1
l_0_13.SignatureName = l_0_6
l_0_13.AnomalyTableName = l_0_5
l_0_13.Key = l_0_4
if l_0_7 then
  l_0_13.MarkerEntryType = "MarkerFound"
  if l_0_7.Count then
    l_0_10 = l_0_7.Count
  end
  l_0_8 = l_0_7.LastSeen
else
  l_0_10 = l_0_9
  l_0_11, l_0_12 = pcall(MpCommon.AnomalyEventUpdate, l_0_5, "MarkerRecord_RMMAnomaly", l_0_9, 1)
  if not l_0_11 then
    l_0_13.Error = l_0_12
  end
  l_0_13.MarkerEntryType = "MarkerCreated"
end
local l_0_14 = (l_0_9 - l_0_10) / 60
l_0_13.TableUnbiasedTime = l_0_14
l_0_13.current_time = l_0_9
l_0_13.marker_UnbiasedTime = l_0_10
l_0_13.TableLastSeen = l_0_8
local l_0_15 = MpCommon.AnomalyEventLookup(l_0_5, l_0_4, 1)
if not l_0_15 then
  if l_0_14 > 10080 then
    l_0_13.EntryType = "AddedAfterThreshold"
    local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_16 then
      local l_0_17, l_0_18 = pcall(MpCommon.QuerySessionInformation, l_0_16, MpCommon.WTSIsRemoteSession)
      l_0_18 = l_0_17 and l_0_18 or "FALSE"
      l_0_13.isRemote = tostring(l_0_18)
      local l_0_19, l_0_20 = pcall(MpCommon.QuerySessionInformation, l_0_16, MpCommon.WTSDomainName)
      if l_0_19 and l_0_20 and l_0_20 ~= "" then
        local l_0_21 = scrubData(l_0_20)
        l_0_13.DomainName = tostring(l_0_21)
      end
      local l_0_22, l_0_23 = pcall(MpCommon.QuerySessionInformation, l_0_16, MpCommon.WTSUserName)
      if l_0_22 and l_0_23 and l_0_23 ~= "" then
        local l_0_24 = scrubData(l_0_23)
        l_0_13.UserName = tostring(l_0_24)
      end
      local l_0_25, l_0_26 = pcall(MpCommon.QuerySessionInformation, l_0_16, MpCommon.WTSClientAddress)
      if l_0_25 and l_0_26 and l_0_26 ~= "" then
        local l_0_27 = scrubData(l_0_26)
        l_0_13.IP = tostring(l_0_27)
      end
      local l_0_28, l_0_29 = pcall(MpCommon.QuerySessionInformation, l_0_16, MpCommon.WTSClientName)
      if l_0_28 and l_0_29 and l_0_29 ~= "" then
        local l_0_30 = scrubData(l_0_29)
        l_0_13.ClientName = tostring(l_0_30)
      end
      local l_0_31 = "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|"
      local l_0_32, l_0_33 = checkParentProcessNameFromListByPPIDRecursive(l_0_16, l_0_31, 2)
      if not l_0_32 or not l_0_33 then
        local l_0_34 = mp.GetParentProcInfo(l_0_16)
        if l_0_34 ~= nil then
          l_0_13.Parent = string.lower(l_0_34.image_path)
        else
          l_0_13.Parent = "Untracked"
        end
      else
        l_0_13.Parent = l_0_33
      end
    end
    set_research_data("RMM_Anomaly", safeJsonSerialize(l_0_13), false)
    return mp.INFECTED
  else
    l_0_13.EntryType = "NewTable"
    MpCommon.AnomalyEventUpdate(l_0_5, l_0_4, 1, 1)
  end
else
  local l_0_35 = l_0_15.Count + 1
  l_0_13.EntryType = "NewKey"
  MpCommon.AnomalyEventUpdate(l_0_5, l_0_4, l_0_35, 1)
  set_research_data("RMM_Anomaly", safeJsonSerialize(l_0_13), false)
  mp.set_mpattribute("Lua:RMMAnomalyNewKey")
end
return mp.CLEAN
