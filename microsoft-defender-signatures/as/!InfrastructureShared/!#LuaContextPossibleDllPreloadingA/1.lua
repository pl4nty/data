local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    goto lbl_33
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L2_1 = "winbio.dll|amsi.dll|wldp.dll|hid.dll|activeds.dll|credui.dll|dpx.dll|dui70.dll|duser.dll|dwmapi.dll|dxgi.dll|fvewiz.dll|mfc42u.dll|oleacc.dll|secur32.dll|slc.dll|spp.dll|tapi32.dll|uxtheme.dll|wer.dll|winbrand.dll|winmm.dll|winsta.dll|wtsapi32.dll|xmllite.dll"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = L1_1
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = {}
L4_1.AttributeName = "Lua:Bioload"
L5_1 = {}
L5_1["facefoduninstaller.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L5_1["%windir%\\system32\\winbioplugins"] = ""
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["winbio.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:AmsiPreload"
L5_1 = {}
L5_1["powershell.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["amsi.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:wldpBypass"
L5_1 = {}
L5_1["rundll32.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["wldp.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:hidPreload"
L5_1 = {}
L5_1["osk.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L5_1["%programfiles%\\common files\\microsoft shared\\ink"] = ""
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["hid.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:activedsPreload"
L5_1 = {}
L5_1["agentservice.exe"] = ""
L5_1["sppextcomobj.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["activeds.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:creduiPreload"
L5_1 = {}
L5_1["mstsc.exe"] = ""
L5_1["wfs.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["credui.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:dpxPreload"
L5_1 = {}
L5_1["lpksetup.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["dpx.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:duiPreload"
L5_1 = {}
L5_1["bdechangepin.exe"] = ""
L5_1["camerasettingsuihost.exe"] = ""
L5_1["cloudstoragewizard.exe"] = ""
L5_1["displayswitch.exe"] = ""
L5_1["dmnotificationbroker.exe"] = ""
L5_1["dpapimig.exe"] = ""
L5_1["licensingui.exe"] = ""
L5_1["phoneactivate.exe"] = ""
L5_1["proximityuxhost.exe"] = ""
L5_1["sessionmsg.exe"] = ""
L5_1["sysreseterr.exe"] = ""
L5_1["utilman.exe"] = ""
L5_1["windowsactiondialog.exe"] = ""
L5_1["wlrmdr.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["dui70.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:duserPreload"
L5_1 = {}
L5_1["bdeunlock.exe"] = ""
L5_1["msdt.exe"] = ""
L5_1["utilman.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["duser.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:dwmapiPreload"
L5_1 = {}
L5_1["dxpserver.exe"] = ""
L5_1["gamepanel.exe"] = ""
L5_1["proximityuxhost.exe"] = ""
L5_1["rdpinit.exe"] = ""
L5_1["rdvghelper.exe"] = ""
L5_1["sndvol.exe"] = ""
L5_1["wmpdmc.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["dwmapi.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:dxgiPreload"
L5_1 = {}
L5_1["dxgiadaptercache.exe"] = ""
L5_1["gamepanel.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["dxgi.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:fvewizPreload"
L5_1 = {}
L5_1["bitlockerwizard.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["fvewiz.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:mfc42uPreload"
L5_1 = {}
L5_1["devicepairingwizard.exe"] = ""
L5_1["fxscover.exe"] = ""
L5_1["irftp.exe"] = ""
L5_1["msinfo32.exe"] = ""
L5_1["mspaint.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["mfc42u.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:oleaccPreload"
L5_1 = {}
L5_1["cttune.exe"] = ""
L5_1["rtkauduservice64.exe"] = ""
L5_1["utilman.exe"] = ""
L5_1["wmpdmc.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["oleacc.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:uxthemePreload"
L5_1 = {}
L5_1["atbroker.exe"] = ""
L5_1["cttune.exe"] = ""
L5_1["displayswitch.exe"] = ""
L5_1["ehstorauthn.exe"] = ""
L5_1["gamepanel.exe"] = ""
L5_1["isoburn.exe"] = ""
L5_1["msdt.exe"] = ""
L5_1["sethc.exe"] = ""
L5_1["sndvol.exe"] = ""
L5_1["wfs.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["uxtheme.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:wtsapi32Preload"
L5_1 = {}
L5_1["bdeuisrv.exe"] = ""
L5_1["igfxcuiservice.exe"] = ""
L5_1["igfxem.exe"] = ""
L5_1["mblctr.exe"] = ""
L5_1["mdmappinstaller.exe"] = ""
L5_1["raserver.exe"] = ""
L5_1["rdpinit.exe"] = ""
L5_1["rdvghelper.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["wtsapi32.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:xmllitePreload"
L5_1 = {}
L5_1["ddodiag.exe"] = ""
L5_1["deviceenroller.exe"] = ""
L5_1["dxpserver.exe"] = ""
L5_1["musnotificationux.exe"] = ""
L5_1["musnotifyicon.exe"] = ""
L5_1["omadmclient.exe"] = ""
L5_1["upfc.exe"] = ""
L5_1["usocoreworker.exe"] = ""
L5_1["wbengine.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["xmllite.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:slcPreload"
L5_1 = {}
L5_1["msinfo32.exe"] = ""
L5_1["phoneactivate.exe"] = ""
L5_1["slui.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["slc.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:winmmPreload"
L5_1 = {}
L5_1["mblctr.exe"] = ""
L5_1["mstsc.exe"] = ""
L5_1["xpsrchvw.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["winmm.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:winstaPreload"
L5_1 = {}
L5_1["displayswitch.exe"] = ""
L5_1["rdpclip.exe"] = ""
L5_1["rdpsauachelper.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["winsta.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:secur32Preload"
L5_1 = {}
L5_1["mstsc.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["secur32.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:sppPreload"
L5_1 = {}
L5_1["wbengine.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["spp.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:tapi32Preload"
L5_1 = {}
L5_1["dialer.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["tapi32.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:werPreload"
L5_1 = {}
L5_1["dwwin.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["wer.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:winbrandPreload"
L5_1 = {}
L5_1["slui.exe"] = ""
L4_1.ProcessList = L5_1
L5_1 = {}
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["winbrand.dll"] = L4_1
L4_1 = L3_1[L1_1]
if L4_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "Lua:Preload"
L5_1 = L3_1[L1_1]
L5_1 = L5_1.AttributeName
if L5_1 ~= nil then
  L5_1 = L3_1[L1_1]
  L4_1 = L5_1.AttributeName
end
L5_1 = L3_1[L1_1]
L5_1 = L5_1.ProcessList
if L5_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1[L1_1]
L5_1 = L5_1.CleanPathList
if L5_1 == nil then
  L5_1 = L3_1[L1_1]
  L5_1 = L5_1.SuspPathList
  if L5_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = #L5_1
  if not (L6_1 < 1) then
    goto lbl_448
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_448::
L6_1 = normalize_path
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = string
L6_1 = L6_1.lower
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_PROCESSDEVICEPATH
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L7_1(L8_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L6_1 ~= nil then
  L7_1 = #L6_1
  if not (L7_1 < 1) then
    goto lbl_468
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_468::
L7_1 = normalize_path
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
if L5_1 ~= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = ""
L8_1 = L3_1[L1_1]
L8_1 = L8_1.CleanPathList
if L8_1 ~= nil then
  L8_1 = pairs
  L9_1 = L3_1[L1_1]
  L9_1 = L9_1.CleanPathList
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = normalize_path
    L14_1 = mp
    L14_1 = L14_1.ContextualExpandEnvironmentVariables
    L15_1 = L11_1
    L14_1, L15_1 = L14_1(L15_1)
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 == L5_1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
  end
  L7_1 = "NotInCleanPathList"
end
L8_1 = L3_1[L1_1]
L8_1 = L8_1.SuspPathList
if L8_1 ~= nil then
  L8_1 = pairs
  L9_1 = L3_1[L1_1]
  L9_1 = L9_1.SuspPathList
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = normalize_path
    L14_1 = mp
    L14_1 = L14_1.ContextualExpandEnvironmentVariables
    L15_1 = L11_1
    L14_1, L15_1 = L14_1(L15_1)
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 == L5_1 then
      L7_1 = "SuspPathList"
      break
    end
  end
end
L8_1 = L3_1[L1_1]
L8_1 = L8_1.ProcessList
if L8_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.lower
L9_1 = mp
L9_1 = L9_1.get_contextdata
L10_1 = mp
L10_1 = L10_1.CONTEXT_DATA_PROCESSNAME
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L8_1 ~= nil then
  L9_1 = #L8_1
  if L9_1 ~= 0 then
    goto lbl_545
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_545::
L9_1 = L3_1[L1_1]
L9_1 = L9_1.ProcessList
L9_1 = L9_1[L8_1]
if L9_1 ~= nil then
  L9_1 = L4_1
  L10_1 = "_"
  L11_1 = L8_1
  L12_1 = "!"
  L13_1 = L7_1
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
  L10_1 = #L9_1
  if 62 < L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = L9_1
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
else
  L9_1 = mp
  L9_1 = L9_1.get_contextdata
  L10_1 = mp
  L10_1 = L10_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L9_1 = L9_1(L10_1)
  if L9_1 == true then
    L9_1 = L5_1
    L10_1 = "\\"
    L11_1 = L1_1
    L9_1 = L9_1 .. L10_1 .. L11_1
    L10_1 = mp
    L10_1 = L10_1.IsKnownFriendlyFile
    L11_1 = L9_1
    L12_1 = false
    L13_1 = false
    L10_1 = L10_1(L11_1, L12_1, L13_1)
    if L10_1 ~= true then
      L10_1 = mp
      L10_1 = L10_1.IsTrustedFile
      L11_1 = false
      L10_1 = L10_1(L11_1)
      if L10_1 ~= true then
        goto lbl_598
      end
    end
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    do return L10_1 end
    ::lbl_598::
    L10_1 = mp
    L10_1 = L10_1.set_mpattribute
    L11_1 = "MpDisableCaching"
    L10_1(L11_1)
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
