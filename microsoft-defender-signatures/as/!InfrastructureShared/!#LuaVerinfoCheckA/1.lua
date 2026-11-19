-- Threat: !InfrastructureShared
-- Name: !#Lua:VerinfoCheck.A
-- Type: 10
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  mp.set_mpattribute("Lua:NoVerinfo")
  return mp.CLEAN
end
mp.set_mpattribute("Lua:HasVerInfo")
local l_0_1 = l_0_0.CompanyName
if l_0_1 ~= nil then
  for l_0_2 = 32, 47 do
    local l_0_3 = string.format("%c%c%c", l_0_2, l_0_2, l_0_2)
    if string.find(l_0_1, l_0_3, 1, true) ~= nil then
      mp.set_mpattribute("LUA:PEAnomaly_SpecialCompanyName")
      break
    end
  end
  local l_0_4 = l_0_0.LegalCopyright
  if l_0_4 ~= nil and string.find(l_0_4, l_0_1, 1, true) == nil then
    mp.set_mpattribute("LUA:PEAnomaly_CopyrightNotContainsCompany")
  end
end
local l_0_5 = l_0_0.FileVersion
if l_0_5 ~= nil then
  if string.find(l_0_5, "[0-9]", 1) == nil or string.find(l_0_5, ".", 1, true) == nil then
    mp.set_mpattribute("LUA:PEAnomaly_InvalidFileVersion")
  end
  mp.set_mpattribute("LUA:PeFileVersion!" .. l_0_5)
end
local l_0_6, l_0_7 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_7 == nil or l_0_6 == nil then
  return mp.CLEAN
end
local l_0_8 = {
  ["accesschk.exe"] = true,
  ["accesschk64.exe"] = true,
  ["accessenum.exe"] = true,
  ["acrord32.exe"] = true,
  ["adexplorer.exe"] = true,
  ["adinsight.exe"] = true,
  ["adrestore.exe"] = true,
  ["applicationframehost.exe"] = true,
  ["appvclient.exe"] = true,
  ["appvlp.exe"] = true,
  ["atbroker.exe"] = true,
  ["audiodg.exe"] = true,
  ["autoruns.exe"] = true,
  ["autoruns64.exe"] = true,
  ["autorunsc.exe"] = true,
  ["autorunsc64.exe"] = true,
  ["bash.exe"] = true,
  ["bginfo.exe"] = true,
  ["bginfo64.exe"] = true,
  ["bitsadmin.exe"] = true,
  ["browser_broker.exe"] = true,
  ["calc.exe"] = true,
  ["cdb.exe"] = true,
  ["certutil.exe"] = true,
  ["clockres.exe"] = true,
  ["clockres64.exe"] = true,
  ["cmd.exe"] = true,
  ["cmdkey.exe"] = true,
  ["cmstp.exe"] = true,
  ["conhost.exe"] = true,
  ["consent.exe"] = true,
  ["contig.exe"] = true,
  ["contig64.exe"] = true,
  ["control.exe"] = true,
  ["coreinfo.exe"] = true,
  ["csc.exe"] = true,
  ["cscript.exe"] = true,
  ["csi.exe"] = true,
  ["csrss.exe"] = true,
  ["ctfmon.exe"] = true,
  ["ctrl2cap.exe"] = true,
  ["dashost.exe"] = true,
  ["dataexchangehost.exe"] = true,
  ["dbgview.exe"] = true,
  ["dfsvc.exe"] = true,
  ["disk2vhd.exe"] = true,
  ["diskext.exe"] = true,
  ["diskext64.exe"] = true,
  ["diskshadow.exe"] = true,
  ["dllhost.exe"] = true,
  ["dnscmd.exe"] = true,
  ["dnx.exe"] = true,
  ["dxcap.exe"] = true,
  ["esentutl.exe"] = true,
  ["expand.exe"] = true,
  ["explorer.exe"] = true,
  ["extexport.exe"] = true,
  ["extrac32.exe"] = true,
  ["findlinks.exe"] = true,
  ["findlinks64.exe"] = true,
  ["findstr.exe"] = true,
  ["fontdrvhost.exe"] = true,
  ["forfiles.exe"] = true,
  ["fxssvc.exe"] = true,
  ["gpscript.exe"] = true,
  ["gpup.exe"] = true,
  ["handle.exe"] = true,
  ["handle64.exe"] = true,
  ["hex2dec.exe"] = true,
  ["hex2dec64.exe"] = true,
  ["hh.exe"] = true,
  ["ie4uinit.exe"] = true,
  ["ieexec.exe"] = true,
  ["infdefaultinstall.exe"] = true,
  ["installutil.exe"] = true,
  ["junction.exe"] = true,
  ["junction64.exe"] = true,
  ["ldmdump.exe"] = true,
  ["livekd.exe"] = true,
  ["livekd64.exe"] = true,
  ["loadord.exe"] = true,
  ["loadord64.exe"] = true,
  ["loadordc.exe"] = true,
  ["loadordc64.exe"] = true,
  ["lockapp.exe"] = true,
  ["logonsessions.exe"] = true,
  ["logonsessions64.exe"] = true,
  ["lsaiso.exe"] = true,
  ["lsass.exe"] = true,
  ["makecab.exe"] = true,
  ["mavinject.exe"] = true,
  ["mftrace.exe"] = true,
  ["microsoftedge.exe"] = true,
  ["microsoftedgecp.exe"] = true,
  ["microsoftedgesh.exe"] = true,
  ["msbuild.exe"] = true,
  ["msconfig.exe"] = true,
  ["msdeploy.exe"] = true,
  ["msdt.exe"] = true,
  ["msdtc.exe"] = true,
  ["mshta.exe"] = true,
  ["msiexec.exe"] = true,
  ["msxsl.exe"] = true,
  ["netsh.exe"] = true,
  ["nlnotes.exe"] = true,
  ["nltest.exe"] = true,
  ["notes.exe"] = true,
  ["notmyfault.exe"] = true,
  ["notmyfault64.exe"] = true,
  ["notmyfaultc.exe"] = true,
  ["notmyfaultc64.exe"] = true,
  ["ntfsinfo.exe"] = true,
  ["ntfsinfo64.exe"] = true,
  ["ntoskrnl.exe"] = true,
  ["nvudisp.exe"] = true,
  ["nvuhda6.exe"] = true,
  ["odbcconf.exe"] = true,
  ["openwith.exe"] = true,
  ["pagedfrg.exe"] = true,
  ["pcalua.exe"] = true,
  ["pcwrun.exe"] = true,
  ["pendmoves.exe"] = true,
  ["pendmoves64.exe"] = true,
  ["pipelist.exe"] = true,
  ["pipelist64.exe"] = true,
  ["powershell.exe"] = true,
  ["presentationhost.exe"] = true,
  ["print.exe"] = true,
  ["procdump.exe"] = true,
  ["procdump64.exe"] = true,
  ["procexp.exe"] = true,
  ["procexp64.exe"] = true,
  ["procmon.exe"] = true,
  ["psexec.exe"] = true,
  ["psexec64.exe"] = true,
  ["psfile.exe"] = true,
  ["psfile64.exe"] = true,
  ["psgetsid.exe"] = true,
  ["psgetsid64.exe"] = true,
  ["psinfo.exe"] = true,
  ["psinfo64.exe"] = true,
  ["pskill.exe"] = true,
  ["pskill64.exe"] = true,
  ["pslist.exe"] = true,
  ["pslist64.exe"] = true,
  ["psloggedon.exe"] = true,
  ["psloggedon64.exe"] = true,
  ["psloglist.exe"] = true,
  ["psloglist64.exe"] = true,
  ["pspasswd.exe"] = true,
  ["pspasswd64.exe"] = true,
  ["psping.exe"] = true,
  ["psping64.exe"] = true,
  ["psr.exe"] = true,
  ["psservice.exe"] = true,
  ["psservice64.exe"] = true,
  ["psshutdown.exe"] = true,
  ["pssuspend.exe"] = true,
  ["pssuspend64.exe"] = true,
  ["pwsh.exe"] = true,
  ["rammap.exe"] = true,
  ["rcsi.exe"] = true,
  ["reg.exe"] = true,
  ["regasm.exe"] = true,
  ["regdelnull.exe"] = true,
  ["regdelnull64.exe"] = true,
  ["regedit.exe"] = true,
  ["register-cimprovider"] = true,
  ["regjump.exe"] = true,
  ["regsvcs.exe"] = true,
  ["regsvr32.exe"] = true,
  ["replace.exe"] = true,
  ["robocopy.exe"] = true,
  ["roccat_swarm.exe"] = true,
  ["rpcping.exe"] = true,
  ["rundll32.exe"] = true,
  ["runonce.exe"] = true,
  ["runscripthelper.exe"] = true,
  ["runtimebroker.exe"] = true,
  ["sc.exe"] = true,
  ["scriptrunner.exe"] = true,
  ["sdelete.exe"] = true,
  ["sdelete64.exe"] = true,
  ["sdiagnhost.exe"] = true,
  ["searchfilterhost.exe"] = true,
  ["searchindexer.exe"] = true,
  ["searchprotocolhost.exe"] = true,
  ["securityhealthservice.exe"] = true,
  ["services.exe"] = true,
  ["settingsynchost.exe"] = true,
  ["sgrmbroker.exe"] = true,
  ["sigcheck.exe"] = true,
  ["sigcheck64.exe"] = true,
  ["sihost.exe"] = true,
  ["smartscreen.exe"] = true,
  ["smss.exe"] = true,
  ["splwow64.exe"] = true,
  ["spoolsv.exe"] = true,
  ["sppsvc.exe"] = true,
  ["sqldumper.exe"] = true,
  ["sqlps.exe"] = true,
  ["sqltoolsps.exe"] = true,
  ["streams.exe"] = true,
  ["streams64.exe"] = true,
  ["surfacecolorservice.exe"] = true,
  ["surfaceservice.exe"] = true,
  ["svchost.exe"] = true,
  ["syncappvpublishingserver.exe"] = true,
  ["synchost.exe"] = true,
  ["sysmon.exe"] = true,
  ["sysmon64.exe"] = true,
  ["systemsettingsbroker.exe"] = true,
  ["taskhostw.exe"] = true,
  ["taskmgr.exe"] = true,
  ["tcpvcon.exe"] = true,
  ["tcpview.exe"] = true,
  ["te.exe"] = true,
  ["tracker.exe"] = true,
  ["usbinst.exe"] = true,
  ["vboxdrvinst.exe"] = true,
  ["vmcompute.exe"] = true,
  ["vmmap.exe"] = true,
  ["vmms.exe"] = true,
  ["vsjitdebugger.exe"] = true,
  ["vssvc.exe"] = true,
  ["wab.exe"] = true,
  ["werfault.exe"] = true,
  ["werfaultsecure.exe"] = true,
  ["wininit.exe"] = true,
  ["winlogon.exe"] = true,
  ["winobj.exe"] = true,
  ["winword.exe"] = true,
  ["wmiapsrv.exe"] = true,
  ["wmic.exe"] = true,
  ["wmiprvse.exe"] = true,
  ["wscript.exe"] = true,
  ["wsmprovhost.exe"] = true,
  ["wuauclt.exe"] = true,
  ["wudfhost.exe"] = true,
  ["xwizard.exe"] = true
}
local l_0_9 = {
  ["activeds.dll"] = true,
  ["amsi.dll"] = true,
  ["credui.dll"] = true,
  ["dbgeng.dll"] = true,
  ["dbghelp.dll"] = true,
  ["diagtrack.dll"] = true,
  ["dpx.dll"] = true,
  ["dui70.dll"] = true,
  ["duser.dll"] = true,
  ["dwmapi.dll"] = true,
  ["dxgi.dll"] = true,
  ["emet.dll"] = true,
  ["fvewiz.dll"] = true,
  ["hid.dll"] = true,
  ["kernel32.dll"] = true,
  ["mfc42u.dll"] = true,
  ["oleacc.dll"] = true,
  ["secur32.dll"] = true,
  ["slc.dll"] = true,
  ["spp.dll"] = true,
  ["tapi32.dll"] = true,
  ["user32.dll"] = true,
  ["uxtheme.dll"] = true,
  ["wer.dll"] = true,
  ["winbio.dll"] = true,
  ["winbrand.dll"] = true,
  ["windowscoredeviceinfo.dll"] = true,
  ["winmm.dll"] = true,
  ["winsta.dll"] = true,
  ["wldp.dll"] = true,
  ["wtsapi32.dll"] = true,
  ["xmllite.dll"] = true,
  ["unidrv.dll"] = true
}
local l_0_10 = false
local l_0_11 = false
local l_0_12 = false
local l_0_13 = false
local l_0_14 = false
local l_0_15 = false
local l_0_16 = false
l_0_7 = l_0_7:gsub("%.exe%.mui", ".exe")
if l_0_6:find("\\windows\\winsxs\\", 1, true) or l_0_6:find("\\\\$windows.~bt\\\\", 1, true) or l_0_6:find("\\windows\\softwaredistribution\\", 1, true) or l_0_6:find("\\windows.old\\", 1, true) or l_0_6:find("\\\\winsehotfix\\hotfixes\\", 1, true) or l_0_6:find("\\harddiskvolume.?.?.?\\windows") or l_0_6:find("\\windows\\assembly\\nativeimages", 1, true) or l_0_6:find("windows\\ccm", 1, true) then
  mp.set_mpattribute("Lua:PeInExcludedOsPath")
  l_0_11 = true
end
if l_0_6:find(":\\windows\\system32", 1, true) or l_0_6:find(":\\windows\\syswow64", 1, true) then
  mp.set_mpattribute("Lua:PeInSystemFolder")
  l_0_12 = true
  if l_0_6:find("\\spool", 1, true) then
    l_0_12 = false
    l_0_16 = true
    mp.set_mpattribute("Lua:PeInSpoolFolder")
  end
end
if l_0_6:find("c:\\program files\\", 1, true) or l_0_6:find("c:\\program files (x86)\\", 1, true) then
  mp.set_mpattribute("Lua:PeInProgramsFolder")
  l_0_13 = true
end
local l_0_17 = StringSplit(l_0_7, ".")
local l_0_18 = l_0_17[#l_0_17]
if #l_0_17 == 1 then
  mp.set_mpattribute("Lua:PeFileExtension!nil")
elseif l_0_18 ~= nil then
  l_0_18 = #l_0_18 > 5 and l_0_18:sub(-5) or l_0_18
  mp.set_mpattribute("Lua:PeFileExtension!" .. l_0_18)
end
local l_0_19 = l_0_7:gsub(" ", "_")
mp.set_mpattribute("Lua:PeFSFileName!" .. l_0_19)
local l_0_20 = l_0_0.ProductName
local l_0_21 = ""
if l_0_20 then
  l_0_20 = string.lower(l_0_20)
  l_0_20 = l_0_20:gsub("%.exe%.mui", ".exe")
  l_0_21 = l_0_20:gsub(" ", "_")
  mp.set_mpattribute("Lua:PeProductName!" .. l_0_21)
else
  mp.set_mpattribute("Lua:PeProductName!nil")
end
local l_0_22 = l_0_0.InternalName
local l_0_23 = ""
if l_0_22 then
  l_0_22 = string.lower(l_0_22)
  l_0_22 = l_0_22:gsub("%.exe%.mui", ".exe")
  l_0_23 = l_0_22:gsub(" ", "_")
  mp.set_mpattribute("Lua:PeInternalName!" .. l_0_23)
  if l_0_22 ~= l_0_7 then
    mp.set_mpattribute("Lua:PeInternalNameDiffFromFileName")
  else
    mp.set_mpattribute("Lua:PeInternalNameMatchedFileName")
  end
else
  mp.set_mpattribute("Lua:PeInternalName!nil")
end
local l_0_24 = l_0_0.OriginalFilename
local l_0_25 = ""
if l_0_24 then
  l_0_24 = string.lower(l_0_24)
  local l_0_26 = l_0_24:match("%.([^%.]+)$")
  if l_0_26 ~= nil and #l_0_26 >= 1 then
    mp.set_mpattribute("Lua:PeOriginalNameExt!" .. l_0_26)
  end
  l_0_24 = l_0_24:gsub("%.exe%.mui", ".exe")
  l_0_25 = l_0_24:gsub(" ", "_")
  mp.set_mpattribute("Lua:PeOriginalName!" .. l_0_25)
  if l_0_24 ~= l_0_7 then
    mp.set_mpattribute("Lua:PeOriginalNameDiffFromFileName")
    l_0_10 = true
  else
    mp.set_mpattribute("Lua:PeOriginalNameMatchedFileName")
  end
else
  l_0_24 = "nil"
  mp.set_mpattribute("Lua:PeOriginalName!nil")
end
local l_0_27 = false
if l_0_18 == "exe" and (l_0_8[l_0_24] or l_0_8[l_0_7]) then
  l_0_27 = true
end
if l_0_18 == "dll" and (l_0_9[l_0_24] or l_0_9[l_0_7]) then
  l_0_27 = true
end
if l_0_16 or l_0_27 and not l_0_11 then
  if mp.IsTrustedFile() then
    l_0_15 = true
    mp.set_mpattribute("Lua:PeIsTrustedLolbin")
    mp.set_mpattribute("Lua:PeIsTrustedLolbin!" .. l_0_24)
    mp.set_mpattribute("Lua:PeIsTrustedLolbinFile!" .. l_0_7)
  else
    mp.set_mpattribute("Lua:PeUntrustedLolbin")
    mp.set_mpattribute("Lua:PeUnTrustedLolbin!" .. l_0_24)
    mp.set_mpattribute("Lua:PeUnTrustedLolbinFile!" .. l_0_7)
    mp.set_mpattribute("Lua:PeUntrustedLolbinExt!" .. l_0_18)
  end
end
local l_0_28 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_28 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_29 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  l_0_14 = true
  mp.set_mpattribute("Lua:NewPeFile")
  mp.set_mpattribute("Lua:NewPeFile!" .. l_0_7)
  if #l_0_29 > 38 then
    mp.set_mpattribute("Lua:RtpProcNameTooLong")
  else
    mp.set_mpattribute("Lua:NewPeFileWrittenBy!" .. l_0_29)
  end
  if l_0_29:find("rufus", 1, true) then
    mp.set_mpattribute("Lua:NewPeFileWrittenBy!rufus")
  end
  if l_0_29 == "mscorsvw.exe" and (l_0_7:match("%.ni%.exe$") or l_0_7:match("%.ni%.dll$")) then
    mp.set_mpattribute("Lua:CleanFileWrittenBy!mscorsvw.exe")
  end
  if l_0_27 and not l_0_12 and not l_0_11 and l_0_10 then
    mp.set_mpattribute("MpDisableCaching")
  end
end
local l_0_30 = "dll|ocx"
if l_0_14 and not l_0_12 and not l_0_11 and not l_0_15 and not l_0_13 and l_0_10 and l_0_30:find(l_0_18) then
  mp.set_mpattribute("Lua:PossiblyForSideloading!" .. l_0_7)
  mp.set_mpattribute("Lua:PeMonitorForSideload")
end
return mp.INFECTED
