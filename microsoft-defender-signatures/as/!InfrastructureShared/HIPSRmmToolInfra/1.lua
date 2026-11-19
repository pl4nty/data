-- Threat: !InfrastructureShared
-- Name: HIPSRmmToolInfra
-- Type: 1

function IsRmmToolFilePath(l_1_0)
  if string.find(l_1_0, ":\\windows\\", 1, true) ~= nil then
    local l_1_1 = {
      "\\pdq\\pdqdeployrunner\\",
      
      "\\action1\\",
      "\\laplink everywhere"
    }
    for l_1_2, l_1_3 in ipairs(l_1_1) do
      if string.find(l_1_0, l_1_3, 1, true) ~= nil then
        return true
      end
    end
  end
  if string.find(l_1_0, ":\\program files", 1, true) ~= nil then
    local l_1_4 = {
      "\\anydesk\\",
      "\\atera networks\\ateraagent\\",
      "\\splashtop\\splashtop remote\\",
      "\\teamviewer\\",
      "\\connectwise\\",
      "\\netsupport\\",
      "\\apps\\support\\netsupport\\",
      "\\screenconnect client ",
      "\\ammyy admin\\",
      "\\aweray\\awesun\\",
      "\\centrastage\\",
      "\\solarwinds\\dameware mini remote control x64\\",
      "\\dameware remote everywhere agent\\",
      "\\kaseya\\",
      "\\kaseya\\",
      "\\logmein\\",
      "\\gotoassist remote support",
      "\\mremoteng\\",
      "\\n-able technologies\\",
      "\\solarwinds\\",
      "\\pdq\\pdq remote desktop agent\\",
      "\\pdq\\pdqconnectagent\\",
      "\\pdq\\pdqconnectupdater\\",
      "\\radmin\\",
      "\\realvnc\\",
      "\\remotepc host\\",
      "\\remotepc viewer\\",
      "\\remotepc\\",
      "\\esq sst\\rmm agent\\",
      "\\rustdesk\\",
      "\\rustdesk-fullclient\\",
      "\\supremo\\",
      "\\repairtech\\syncro\\",
      "\\tacticalagent\\",
      "\\tigervnc\\",
      "\\tigervnc server\\",
      "\\tightvnc\\",
      "\\google\\chrome remote desktop\\",
      "\\ultraviewer\\",
      "\\ninjaone\\",
      "\\manageengine\\uems_agent\\",
      "\\site24x7\\winagent\\",
      "\\pulseway\\",
      "\\access remote pc",
      "\\level\\",
      "\\adobe\\connect\\",
      "\\aeroadmin\\",
      "\\aliwangwang\\",
      "\\anyplace control\\",
      "\\anyviewer\\",
      "\\aweray\\awesun\\",
      "\\beanywhere support express\\",
      "\\beyondtrust",
      "\\monitoring client\\plugins\\bomgar\\",
      "\\bomgarjump\\",
      "\\bitvise ssh client\\",
      "\\bitvise ssh server\\",
      "\\crosstec remote control\\",
      "\\nch software\\desktopnow\\",
      "\\domotz\\",
      "\\dwagent\\",
      "\\bravura\\optitune\\",
      "\\ehorus_agent\\",
      "\\emco\\remote agents\\remote installer\\",
      "\\emco\\remote installer\\",
      "\\ericom software\\ericom access server\\",
      "\\ericom software\\ericom connect remote agent",
      "\\ezhelp\\server\\",
      "\\fastviewer remoted service\\",
      "\\simplehelp\\",
      "\\getscreen\\",
      "gotohttpremotecontrolfrombrowser",
      "\\gotomypc\\",
      "\\goverlan inc\\goverlanagent\\",
      "\\helpu\\",
      "\\impero solutions ltd\\impero client\\",
      "\\instant housecall\\",
      "\\itarian\\endpoint manager\\",
      "\\itarian\\remotecontrol\\",
      "\\jumpcloud\\",
      "\\phase five systems\\jump desktop connect\\",
      "\\repairtech\\kabuto\\",
      "\\khelpdesk\\",
      "\\laplink everywhere\\",
      "\\laplink gold\\",
      "meshcentral agent\\mesh agent\\",
      "\\mionet\\",
      "\\mobatek\\mobaxterm\\",
      "\\naverisk\\",
      "\\netop\\netop remote control\\",
      "\\netsupport manager\\",
      "\\kyocera\\netviewer\\",
      "\\panorama9\\",
      "\\parallels\\parallels access\\",
      "\\pcanywhere\\",
      "\\wyse\\pocketcloud\\",
      "\\pulseway remote control\\",
      "\\fleetdeck agent\\"
    }
    for l_1_5, l_1_6 in ipairs(l_1_4) do
      if string.find(l_1_0, l_1_6, 1, true) ~= nil then
        return true
      end
    end
    local l_1_7 = {
      "\\anydesk[^_]+_msi\\",
      "\\intelliadmin%d*\\",
      "\\litemanager%s+pro%s+",
      "\\radmin viewer[%s%d]*\\",
      "\\remote utilities[%s%-]+host\\",
      "\\remote manipulator system[%s%-]+host\\",
      "\\remote manipulator system[%s%-]+viewer\\",
      "\\nomachine[^\\]+\\bin\\nxplayer",
      "\\getscreen%.me\\",
      "\\goverlan reach console %d+\\",
      "\\isl online [^%s\\]*\\isl light\\",
      "\\isl online[^\\]*\\isl alwayson"
    }
    for l_1_8, l_1_9 in ipairs(l_1_7) do
      if string.find(l_1_0, l_1_9) ~= nil then
        return true
      end
    end
  end
  if string.find(l_1_0, ":\\programdata\\", 1, true) ~= nil then
    local l_1_10 = {
      "\\centrastage\\",
      "\\kaseya\\",
      "\\ninjarmmagent\\",
      "\\zohoassist\\",
      "\\ctes\\",
      "\\aeroadmin\\",
      "\\bomgar",
      "\\distant desktop\\",
      "\\simplehelp\\elevatesh",
      "\\phase five systems\\jump desktop connect\\",
      "\\khelpdesk\\"
    }
    for l_1_11, l_1_12 in ipairs(l_1_10) do
      if string.find(l_1_0, l_1_12, 1, true) ~= nil then
        return true
      end
    end
  end
  if string.find(l_1_0, "\\appdata\\", 1, true) ~= nil then
    local l_1_13 = {
      "\\adobe\\connect\\",
      "\\beyondtrust",
      "\\ezhelp\\server\\",
      "\\jwrapper-simplehelp technician\\",
      "\\gotomypc\\",
      "\\mobaxterm\\",
      "\\pulseway remote control\\"
    }
    for l_1_14, l_1_15 in ipairs(l_1_13) do
      if string.find(l_1_0, l_1_15, 1, true) ~= nil then
        return true
      end
    end
    local l_1_16 = {
      "\\beamyourscreen[%s%d]*\\",
      "\\isl online [^%s\\]*\\isl light\\"
    }
    for l_1_17, l_1_18 in ipairs(l_1_16) do
      if string.find(l_1_0, l_1_18) ~= nil then
        return true
      end
    end
  end
  local l_1_19 = {
    "\\ninjarmm llc qc\\",
    "\\connectwise\\",
    "\\logmein\\",
    "\\gotoassist remote support",
    "\\zoho-assist-desktop\\",
    "\\acronis cyber protect connect",
    "\\remotix\\",
    "\\anysupport\\",
    "\\auvik\\",
    "\\beyondtrust\\",
    "\\desktopcentral_server\\",
    "\\desktopcentral_agent\\",
    "\\pcvisit software ag\\",
    "\\putty\\"
  }
  for l_1_20, l_1_21 in ipairs(l_1_19) do
    if string.find(l_1_0, l_1_21, 1, true) ~= nil then
      return true
    end
  end
  return false
end

function IsRmmToolVersionInfo(l_2_0)
  local l_2_1 = {
    "anydesk",
    "atera",
    "splashtop",
    "teamviewer",
    "connectwise",
    "netsupport",
    "screenconnect",
    "ammyy admin",
    "awesun",
    "rmm agent",
    "rmm webremote agent",
    "n-able take control",
    "dameware",
    "kaseya",
    "romfusclient",
    "romviewer",
    "romserver",
    "lite manager",
    "lmiguardiansvc",
    "logmein",
    "gotoassist",
    "mremoteng",
    "nable",
    "solarwinds",
    "ninjaremote",
    "pdq deploy",
    "pdq.com",
    "pdq inventory",
    "radmin viewer",
    "realvnc",
    "vncagent",
    "remotepc",
    "remote utilities",
    "remote manipulator system",
    "rustdesk",
    "supremo",
    "syncro",
    "tactical rmm",
    "tigervnc",
    "tightvnc",
    "zoho assist",
    "chrome remote desktop",
    "ultraviewer",
    "ninjarmm",
    "ninjawpm",
    "manageengine",
    "site24x7",
    "247ithelp",
    "remote workforce client",
    "absolute ",
    "ctesdetect",
    "access remote pc",
    "acronis",
    "level remote control",
    "action1",
    "adobe connect",
    "aeroadmin",
    "alpemix",
    "anysupport",
    "anyplace",
    "anyviewer",
    "auvik",
    "awesun",
    "bitvise",
    "crosstec remote control",
    "crosstec client application",
    "desktopnow",
    "distant desktop",
    "optitune",
    "ehorus",
    "emco remote installer",
    "emco remote service",
    "ericom blaze",
    "ericomrdp",
    "ericom access server",
    "ericom access accessnow",
    "ericom blaze",
    "fastviewer",
    "nomachine player",
    "freerdp",
    "simplehelp",
    "getscreen.me",
    "gotohttp",
    "gotomypc",
    "goverlan",
    "helpu viewer",
    "helpu auto updater",
    "helpu manager",
    "helpu host",
    "impero connect",
    "impero remote manager",
    "imperoclient",
    "imperoutilities",
    "imperoclientsvc",
    "instant housecall",
    "isl light",
    "isl alwayson",
    "endpoint manager rmm service",
    "remote control by itarian",
    "ivanti agentless rc",
    "windows agentless remote control",
    "jumpcloud remote assist",
    "jumpcloud agent",
    "jump desktop",
    "kabuto",
    "khelpdesk",
    "kickidler",
    "laplink everywhere",
    "laplink gold",
    "manageengine",
    "manage engine",
    "endpointcentral",
    "endpoint central",
    "desktopcentral",
    "desktop central",
    "meshcentral",
    "mesh central",
    "mesh agent service",
    "mionet",
    "mobaxterm",
    "naverisk",
    "netop remote control",
    "netop helper service",
    "netsupport remote control",
    "netsupport manager",
    "cpr viewer",
    "algorius net viewer",
    "kyocera net viewer",
    "panorama9",
    "parallels access",
    "pcanywhere",
    "pcvisit",
    "wyseremoteaccess",
    "wyse remote access",
    "pocketcloud",
    "putty",
    "pulseway"
  }
  local l_2_2 = {
    "tv_w32.exe",
    "tv_x64.exe",
    "cagservice.exe",
    "aemagent.exe",
    "intelliadmin.exe",
    "kausrtsk.exe",
    "litemanager.exe",
    "lmiguardiansvc",
    "ncstreamer.exe",
    "pdqdeployconsole.exe",
    "pdqrunner.exe",
    "pdqinventoryconsole.exe",
    "pdqinventoryscanner.exe",
    "radmin.exe",
    "vncserverui.exe",
    "vncviewer.exe",
    "winvnc4.exe",
    "vncserver.exe",
    "vncconfig.exe",
    "vncaddrbook.exe",
    "rpcvieweruiu.exe",
    "tacticalrmm.exe",
    "winvnc4.exe",
    "vncviewer.exe",
    "tvnserver.exe",
    "hookldr.exe",
    "remoting_native_messaging_host.exe",
    "remoting_desktop.exe",
    "remoting_host.exe",
    "remoting_assistance_host.exe",
    "ctes.exe",
    "ctespersitence.exe",
    "cteshostsvc.exe",
    "level-remote-control-ffmpeg.exe",
    "action1_agent.exe",
    "adobeconnectaddin.exe",
    "aeroadmin.exe",
    "alitask.exe",
    "alpemix.exe",
    "apc_host.exe",
    "rcclinet.exe",
    "screancap.exe",
    "auvikservice.exe",
    "auvikagent.exe",
    "awesun.exe",
    "beamyourscreen.exe",
    "beamyourscreen-host.exe",
    "basupclphlp.exe",
    "basupsrvc.exe",
    "basupsrvccnfg.exe",
    "basupsrvcupdater.exe",
    "basupsysinf.exe",
    "basuptshelper.exe",
    "tcintegratorcommhelper.exe",
    "tclauncherhelper.exe",
    "totermw.exe",
    "sfsserver.exe",
    "sfsserver64.exe",
    "pcictlui.exe",
    "ehorus_agent.exe",
    "ehorus_kill.exe",
    "ehorus_tray.exe",
    "ehorus_cmd.exe",
    "ehorus_uit.exe",
    "ericomrdp.exe",
    "systemmonitor.exe",
    "fastviewer.exe",
    "nxplayer.exe",
    "wfreerdp.exe",
    "getscreen.exe",
    "gotohttp.exe",
    "g2host.exe",
    "gotomypc.exe",
    "goverlan.exe",
    "helpuviewer.exe",
    "helpuserver.exe",
    "helpuupdater.exe",
    "imperoclientsvc.exe",
    "instanthousecall.exe",
    "rmmservice.exe",
    "agentlessrc.exe",
    "jumpcloud-agent.exe",
    "jumpconnect.exe",
    "jumpdesktopconnect.exe",
    "jumpupdater.exe",
    "jumpdesktopupdater.exe",
    "jumpclient.exe",
    "kabuto.app.runner.exe",
    "kabuto.service.runner.exe",
    "khelpdesk.exe",
    "oosysremotedesktopui.exe",
    "oosysagent.exe",
    "laplink.exe",
    "netviewer.exe",
    "netviewerserver.exe",
    "prlsvcctl.exe",
    "prl_deskctl_agent.exe",
    "prl_deskctl_wizard.exe",
    "pcvisit_service_client.exe",
    "pcvisit_client.exe",
    "wyseremoteaccess.exe",
    "pocketcloudservice.exe",
    "remotedesktop.exe",
    "fleetdeck_agent_svc.exe"
  }
  local l_2_3 = sysio.GetPEVersionInfo(l_2_0)
  if l_2_3 == nil then
    return false
  end
  if l_2_3.OriginalFilename ~= nil and l_2_3.OriginalFilename ~= "" then
    do
      local l_2_4 = string.lower(l_2_3.OriginalFilename)
      for l_2_5, l_2_6 in ipairs(l_2_1) do
        if string.find(l_2_4, l_2_6, 1, true) ~= nil then
          return true
        end
      end
      for l_2_7, l_2_8 in ipairs(l_2_2) do
        if l_2_4 == l_2_8 then
          return true
        end
      end
    end
  elseif l_2_3.ProductName ~= nil and l_2_3.ProductName ~= "" then
    do
      local l_2_9 = string.lower(l_2_3.ProductName)
      for l_2_10, l_2_11 in ipairs(l_2_1) do
        if string.find(l_2_9, l_2_11, 1, true) ~= nil then
          return true
        end
      end
    end
  elseif l_2_3.FileDescription ~= nil and l_2_3.FileDescription ~= "" then
    local l_2_12 = string.lower(l_2_3.FileDescription)
    for l_2_13, l_2_14 in ipairs(l_2_1) do
      if string.find(l_2_12, l_2_14, 1, true) ~= nil then
        return true
      end
    end
    for l_2_15, l_2_16 in ipairs(l_2_2) do
      if string.find(l_2_12, l_2_16, 1, true) ~= nil then
        return true
      end
    end
  end
  return false
end

function IsRmmToolOFN(l_3_0)
  local l_3_1 = MpCommon.GetOriginalFileName(l_3_0)
  if l_3_1 ~= nil and l_3_1 ~= "" then
    l_3_1 = string.lower(l_3_1)
    local l_3_2
    l_3_2 = string.match(l_3_1, "%.([^%.]+)$")
    if l_3_2 == nil then
      l_3_1 = l_3_1 .. ".exe"
      l_3_2 = "exe"
    end
    if l_3_2 == "exe" then
      local l_3_3 = {
        "tv_w32.exe",
        "tv_x64.exe",
        "cagservice.exe",
        "aemagent.exe",
        "intelliadmin.exe",
        "kausrtsk.exe",
        "litemanager.exe",
        "lmiguardiansvc",
        "ncstreamer.exe",
        "pdqdeployconsole.exe",
        "pdqrunner.exe",
        "pdqinventoryconsole.exe",
        "pdqinventoryscanner.exe",
        "radmin.exe",
        "vncserverui.exe",
        "vncviewer.exe",
        "winvnc4.exe",
        "vncserver.exe",
        "vncconfig.exe",
        "vncaddrbook.exe",
        "rpcvieweruiu.exe",
        "tacticalrmm.exe",
        "winvnc4.exe",
        "vncviewer.exe",
        "tvnserver.exe",
        "hookldr.exe",
        "remoting_native_messaging_host.exe",
        "remoting_desktop.exe",
        "remoting_host.exe",
        "remoting_assistance_host.exe",
        "ctes.exe",
        "ctespersitence.exe",
        "cteshostsvc.exe",
        "level-remote-control-ffmpeg.exe",
        "action1_agent.exe",
        "adobeconnectaddin.exe",
        "aeroadmin.exe",
        "alitask.exe",
        "alpemix.exe",
        "apc_host.exe",
        "rcclinet.exe",
        "screancap.exe",
        "auvikservice.exe",
        "auvikagent.exe",
        "awesun.exe",
        "beamyourscreen.exe",
        "beamyourscreen-host.exe",
        "basupclphlp.exe",
        "basupsrvc.exe",
        "basupsrvccnfg.exe",
        "basupsrvcupdater.exe",
        "basupsysinf.exe",
        "basuptshelper.exe",
        "tcintegratorcommhelper.exe",
        "tclauncherhelper.exe",
        "totermw.exe",
        "sfsserver.exe",
        "sfsserver64.exe",
        "pcictlui.exe",
        "ehorus_agent.exe",
        "ehorus_kill.exe",
        "ehorus_tray.exe",
        "ehorus_cmd.exe",
        "ehorus_uit.exe",
        "ericomrdp.exe",
        "systemmonitor.exe",
        "fastviewer.exe",
        "nxplayer.exe",
        "wfreerdp.exe",
        "getscreen.exe",
        "gotohttp.exe",
        "g2host.exe",
        "gotomypc.exe",
        "goverlan.exe",
        "helpuviewer.exe",
        "helpuserver.exe",
        "helpuupdater.exe",
        "imperoclientsvc.exe",
        "instanthousecall.exe",
        "rmmservice.exe",
        "agentlessrc.exe",
        "jumpcloud-agent.exe",
        "jumpconnect.exe",
        "jumpdesktopconnect.exe",
        "jumpupdater.exe",
        "jumpdesktopupdater.exe",
        "jumpclient.exe",
        "kabuto.app.runner.exe",
        "kabuto.service.runner.exe",
        "khelpdesk.exe",
        "oosysremotedesktopui.exe",
        "oosysagent.exe",
        "laplink.exe",
        "netviewer.exe",
        "netviewerserver.exe",
        "prlsvcctl.exe",
        "prl_deskctl_agent.exe",
        "prl_deskctl_wizard.exe",
        "pcvisit_service_client.exe",
        "pcvisit_client.exe",
        "wyseremoteaccess.exe",
        "pocketcloudservice.exe",
        "remotedesktop.exe",
        "fleetdeck_agent_svc.exe"
      }
      for l_3_4, l_3_5 in ipairs(l_3_3) do
        if l_3_1 == l_3_5 then
          return true
        end
      end
    end
  end
  return false
end
