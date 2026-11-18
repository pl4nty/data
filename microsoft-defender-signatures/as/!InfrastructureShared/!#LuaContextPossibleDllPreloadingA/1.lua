-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PossibleDllPreloading.A
-- Type: 10
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = "winbio.dll|amsi.dll|wldp.dll|hid.dll|activeds.dll|credui.dll|dpx.dll|dui70.dll|duser.dll|dwmapi.dll|dxgi.dll|fvewiz.dll|mfc42u.dll|oleacc.dll|secur32.dll|slc.dll|spp.dll|tapi32.dll|uxtheme.dll|wer.dll|winbrand.dll|winmm.dll|winsta.dll|wtsapi32.dll|xmllite.dll"
if not l_0_2:find(l_0_1, 1, true) then
  return mp.CLEAN
end
local l_0_3 = {
  ["winbio.dll"] = {
    AttributeName = "Lua:Bioload",
    ProcessList = {
      ["facefoduninstaller.exe"] = ""
    },
    SuspPathList = {
      ["%windir%\\system32\\winbioplugins"] = ""
    },
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["amsi.dll"] = {
    AttributeName = "Lua:AmsiPreload",
    ProcessList = {
      ["powershell.exe"] = ""
    },
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["wldp.dll"] = {
    AttributeName = "Lua:wldpBypass",
    ProcessList = {
      ["rundll32.exe"] = ""
    },
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["hid.dll"] = {
    AttributeName = "Lua:hidPreload",
    ProcessList = {
      ["osk.exe"] = ""
    },
    SuspPathList = {
      ["%programfiles%\\common files\\microsoft shared\\ink"] = ""
    },
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["activeds.dll"] = {
    AttributeName = "Lua:activedsPreload",
    ProcessList = {
      ["agentservice.exe"] = "",
      ["sppextcomobj.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["credui.dll"] = {
    AttributeName = "Lua:creduiPreload",
    ProcessList = {
      ["mstsc.exe"] = "",
      ["wfs.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["dpx.dll"] = {
    AttributeName = "Lua:dpxPreload",
    ProcessList = {
      ["lpksetup.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["dui70.dll"] = {
    AttributeName = "Lua:duiPreload",
    ProcessList = {
      ["bdechangepin.exe"] = "",
      ["camerasettingsuihost.exe"] = "",
      ["cloudstoragewizard.exe"] = "",
      ["displayswitch.exe"] = "",
      ["dmnotificationbroker.exe"] = "",
      ["dpapimig.exe"] = "",
      ["licensingui.exe"] = "",
      ["phoneactivate.exe"] = "",
      ["proximityuxhost.exe"] = "",
      ["sessionmsg.exe"] = "",
      ["sysreseterr.exe"] = "",
      ["utilman.exe"] = "",
      ["windowsactiondialog.exe"] = "",
      ["wlrmdr.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["duser.dll"] = {
    AttributeName = "Lua:duserPreload",
    ProcessList = {
      ["bdeunlock.exe"] = "",
      ["msdt.exe"] = "",
      ["utilman.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["dwmapi.dll"] = {
    AttributeName = "Lua:dwmapiPreload",
    ProcessList = {
      ["dxpserver.exe"] = "",
      ["gamepanel.exe"] = "",
      ["proximityuxhost.exe"] = "",
      ["rdpinit.exe"] = "",
      ["rdvghelper.exe"] = "",
      ["sndvol.exe"] = "",
      ["wmpdmc.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["dxgi.dll"] = {
    AttributeName = "Lua:dxgiPreload",
    ProcessList = {
      ["dxgiadaptercache.exe"] = "",
      ["gamepanel.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["fvewiz.dll"] = {
    AttributeName = "Lua:fvewizPreload",
    ProcessList = {
      ["bitlockerwizard.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["mfc42u.dll"] = {
    AttributeName = "Lua:mfc42uPreload",
    ProcessList = {
      ["devicepairingwizard.exe"] = "",
      ["fxscover.exe"] = "",
      ["irftp.exe"] = "",
      ["msinfo32.exe"] = "",
      ["mspaint.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["oleacc.dll"] = {
    AttributeName = "Lua:oleaccPreload",
    ProcessList = {
      ["cttune.exe"] = "",
      ["rtkauduservice64.exe"] = "",
      ["utilman.exe"] = "",
      ["wmpdmc.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["uxtheme.dll"] = {
    AttributeName = "Lua:uxthemePreload",
    ProcessList = {
      ["atbroker.exe"] = "",
      ["cttune.exe"] = "",
      ["displayswitch.exe"] = "",
      ["ehstorauthn.exe"] = "",
      ["gamepanel.exe"] = "",
      ["isoburn.exe"] = "",
      ["msdt.exe"] = "",
      ["sethc.exe"] = "",
      ["sndvol.exe"] = "",
      ["wfs.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["wtsapi32.dll"] = {
    AttributeName = "Lua:wtsapi32Preload",
    ProcessList = {
      ["bdeuisrv.exe"] = "",
      ["igfxcuiservice.exe"] = "",
      ["igfxem.exe"] = "",
      ["mblctr.exe"] = "",
      ["mdmappinstaller.exe"] = "",
      ["raserver.exe"] = "",
      ["rdpinit.exe"] = "",
      ["rdvghelper.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["xmllite.dll"] = {
    AttributeName = "Lua:xmllitePreload",
    ProcessList = {
      ["ddodiag.exe"] = "",
      ["deviceenroller.exe"] = "",
      ["dxpserver.exe"] = "",
      ["musnotificationux.exe"] = "",
      ["musnotifyicon.exe"] = "",
      ["omadmclient.exe"] = "",
      ["upfc.exe"] = "",
      ["usocoreworker.exe"] = "",
      ["wbengine.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["slc.dll"] = {
    AttributeName = "Lua:slcPreload",
    ProcessList = {
      ["msinfo32.exe"] = "",
      ["phoneactivate.exe"] = "",
      ["slui.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["winmm.dll"] = {
    AttributeName = "Lua:winmmPreload",
    ProcessList = {
      ["mblctr.exe"] = "",
      ["mstsc.exe"] = "",
      ["xpsrchvw.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["winsta.dll"] = {
    AttributeName = "Lua:winstaPreload",
    ProcessList = {
      ["displayswitch.exe"] = "",
      ["rdpclip.exe"] = "",
      ["rdpsauachelper.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["secur32.dll"] = {
    AttributeName = "Lua:secur32Preload",
    ProcessList = {
      ["mstsc.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["spp.dll"] = {
    AttributeName = "Lua:sppPreload",
    ProcessList = {
      ["wbengine.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["tapi32.dll"] = {
    AttributeName = "Lua:tapi32Preload",
    ProcessList = {
      ["dialer.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["wer.dll"] = {
    AttributeName = "Lua:werPreload",
    ProcessList = {
      ["dwwin.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["winbrand.dll"] = {
    AttributeName = "Lua:winbrandPreload",
    ProcessList = {
      ["slui.exe"] = ""
    },
    SuspPathList = {},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  }
}
if l_0_3[l_0_1] == nil then
  return mp.CLEAN
end
local l_0_4 = "Lua:Preload"
if l_0_3[l_0_1].AttributeName ~= nil then
  l_0_4 = l_0_3[l_0_1].AttributeName
end
if l_0_3[l_0_1].ProcessList == nil then
  return mp.CLEAN
end
if l_0_3[l_0_1].CleanPathList == nil and l_0_3[l_0_1].SuspPathList == nil then
  return mp.CLEAN
end
local l_0_5 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_5 == nil or #l_0_5 < 1 then
  return mp.CLEAN
end
l_0_5 = normalize_path(l_0_5)
local l_0_6 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
if l_0_6 == nil or #l_0_6 < 1 then
  return mp.CLEAN
end
l_0_6 = normalize_path(l_0_6)
if l_0_5 ~= l_0_6 then
  return mp.CLEAN
end
local l_0_7 = ""
if l_0_3[l_0_1].CleanPathList ~= nil then
  for l_0_8, l_0_9 in pairs(l_0_3[l_0_1].CleanPathList) do
    local l_0_10 = normalize_path(mp.ContextualExpandEnvironmentVariables(l_0_8))
    if l_0_10 == l_0_5 then
      return mp.CLEAN
    end
  end
  l_0_7 = "NotInCleanPathList"
end
if l_0_3[l_0_1].SuspPathList ~= nil then
  for l_0_11, l_0_12 in pairs(l_0_3[l_0_1].SuspPathList) do
    if normalize_path(mp.ContextualExpandEnvironmentVariables(l_0_11)) == l_0_5 then
      l_0_7 = "SuspPathList"
      break
    end
  end
end
if l_0_3[l_0_1].ProcessList == nil then
  return mp.CLEAN
end
local l_0_13 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_13 == nil or #l_0_13 == 0 then
  return mp.CLEAN
end
if l_0_3[l_0_1].ProcessList[l_0_13] ~= nil then
  local l_0_14 = l_0_4 .. "_" .. l_0_13 .. "!" .. l_0_7
  if 62 < #l_0_14 then
    return mp.CLEAN
  end
  mp.set_mpattribute(l_0_14)
  return mp.INFECTED
elseif mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_15 = l_0_5 .. "\\" .. l_0_1
  if mp.IsKnownFriendlyFile(l_0_15, false, false) == true or mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  mp.set_mpattribute("MpDisableCaching")
end
return mp.CLEAN
