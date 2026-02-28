local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:NoVerinfo"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:HasVerInfo"
L1_1(L2_1)
L1_1 = L0_1.CompanyName
if L1_1 ~= nil then
  L2_1 = 32
  L3_1 = 47
  L4_1 = 1
  for L5_1 = L2_1, L3_1, L4_1 do
    L6_1 = string
    L6_1 = L6_1.format
    L7_1 = "%c%c%c"
    L8_1 = L5_1
    L9_1 = L5_1
    L10_1 = L5_1
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L1_1
    L9_1 = L6_1
    L10_1 = 1
    L11_1 = true
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if L7_1 ~= nil then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "LUA:PEAnomaly_SpecialCompanyName"
      L7_1(L8_1)
      break
    end
  end
  L2_1 = L0_1.LegalCopyright
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = L1_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "LUA:PEAnomaly_CopyrightNotContainsCompany"
      L3_1(L4_1)
    end
  end
end
L2_1 = L0_1.FileVersion
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "[0-9]"
  L6_1 = 1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "."
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      goto lbl_86
    end
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:PEAnomaly_InvalidFileVersion"
  L3_1(L4_1)
  ::lbl_86::
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:PeFileVersion!"
  L5_1 = L2_1
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.bitor
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_PATH
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L4_1(L5_1, L6_1)
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
if L4_1 == nil or L3_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L5_1["accesschk.exe"] = true
L5_1["accesschk64.exe"] = true
L5_1["accessenum.exe"] = true
L5_1["acrord32.exe"] = true
L5_1["adexplorer.exe"] = true
L5_1["adinsight.exe"] = true
L5_1["adrestore.exe"] = true
L5_1["applicationframehost.exe"] = true
L5_1["appvclient.exe"] = true
L5_1["appvlp.exe"] = true
L5_1["atbroker.exe"] = true
L5_1["audiodg.exe"] = true
L5_1["autoruns.exe"] = true
L5_1["autoruns64.exe"] = true
L5_1["autorunsc.exe"] = true
L5_1["autorunsc64.exe"] = true
L5_1["bash.exe"] = true
L5_1["bginfo.exe"] = true
L5_1["bginfo64.exe"] = true
L5_1["bitsadmin.exe"] = true
L5_1["browser_broker.exe"] = true
L5_1["calc.exe"] = true
L5_1["cdb.exe"] = true
L5_1["certutil.exe"] = true
L5_1["clockres.exe"] = true
L5_1["clockres64.exe"] = true
L5_1["cmd.exe"] = true
L5_1["cmdkey.exe"] = true
L5_1["cmstp.exe"] = true
L5_1["conhost.exe"] = true
L5_1["consent.exe"] = true
L5_1["contig.exe"] = true
L5_1["contig64.exe"] = true
L5_1["control.exe"] = true
L5_1["coreinfo.exe"] = true
L5_1["csc.exe"] = true
L5_1["cscript.exe"] = true
L5_1["csi.exe"] = true
L5_1["csrss.exe"] = true
L5_1["ctfmon.exe"] = true
L5_1["ctrl2cap.exe"] = true
L5_1["dashost.exe"] = true
L5_1["dataexchangehost.exe"] = true
L5_1["dbgview.exe"] = true
L5_1["dfsvc.exe"] = true
L5_1["disk2vhd.exe"] = true
L5_1["diskext.exe"] = true
L5_1["diskext64.exe"] = true
L5_1["diskshadow.exe"] = true
L5_1["dllhost.exe"] = true
L5_1["dnscmd.exe"] = true
L5_1["dnx.exe"] = true
L5_1["dxcap.exe"] = true
L5_1["esentutl.exe"] = true
L5_1["expand.exe"] = true
L5_1["explorer.exe"] = true
L5_1["extexport.exe"] = true
L5_1["extrac32.exe"] = true
L5_1["findlinks.exe"] = true
L5_1["findlinks64.exe"] = true
L5_1["findstr.exe"] = true
L5_1["fontdrvhost.exe"] = true
L5_1["forfiles.exe"] = true
L5_1["fxssvc.exe"] = true
L5_1["gpscript.exe"] = true
L5_1["gpup.exe"] = true
L5_1["handle.exe"] = true
L5_1["handle64.exe"] = true
L5_1["hex2dec.exe"] = true
L5_1["hex2dec64.exe"] = true
L5_1["hh.exe"] = true
L5_1["ie4uinit.exe"] = true
L5_1["ieexec.exe"] = true
L5_1["infdefaultinstall.exe"] = true
L5_1["installutil.exe"] = true
L5_1["junction.exe"] = true
L5_1["junction64.exe"] = true
L5_1["ldmdump.exe"] = true
L5_1["livekd.exe"] = true
L5_1["livekd64.exe"] = true
L5_1["loadord.exe"] = true
L5_1["loadord64.exe"] = true
L5_1["loadordc.exe"] = true
L5_1["loadordc64.exe"] = true
L5_1["lockapp.exe"] = true
L5_1["logonsessions.exe"] = true
L5_1["logonsessions64.exe"] = true
L5_1["lsaiso.exe"] = true
L5_1["lsass.exe"] = true
L5_1["makecab.exe"] = true
L5_1["mavinject.exe"] = true
L5_1["mftrace.exe"] = true
L5_1["microsoftedge.exe"] = true
L5_1["microsoftedgecp.exe"] = true
L5_1["microsoftedgesh.exe"] = true
L5_1["msbuild.exe"] = true
L5_1["msconfig.exe"] = true
L5_1["msdeploy.exe"] = true
L5_1["msdt.exe"] = true
L5_1["msdtc.exe"] = true
L5_1["mshta.exe"] = true
L5_1["msiexec.exe"] = true
L5_1["msxsl.exe"] = true
L5_1["netsh.exe"] = true
L5_1["nlnotes.exe"] = true
L5_1["nltest.exe"] = true
L5_1["notes.exe"] = true
L5_1["notmyfault.exe"] = true
L5_1["notmyfault64.exe"] = true
L5_1["notmyfaultc.exe"] = true
L5_1["notmyfaultc64.exe"] = true
L5_1["ntfsinfo.exe"] = true
L5_1["ntfsinfo64.exe"] = true
L5_1["ntoskrnl.exe"] = true
L5_1["nvudisp.exe"] = true
L5_1["nvuhda6.exe"] = true
L5_1["odbcconf.exe"] = true
L5_1["openwith.exe"] = true
L5_1["pagedfrg.exe"] = true
L5_1["pcalua.exe"] = true
L5_1["pcwrun.exe"] = true
L5_1["pendmoves.exe"] = true
L5_1["pendmoves64.exe"] = true
L5_1["pipelist.exe"] = true
L5_1["pipelist64.exe"] = true
L5_1["powershell.exe"] = true
L5_1["presentationhost.exe"] = true
L5_1["print.exe"] = true
L5_1["procdump.exe"] = true
L5_1["procdump64.exe"] = true
L5_1["procexp.exe"] = true
L5_1["procexp64.exe"] = true
L5_1["procmon.exe"] = true
L5_1["psexec.exe"] = true
L5_1["psexec64.exe"] = true
L5_1["psfile.exe"] = true
L5_1["psfile64.exe"] = true
L5_1["psgetsid.exe"] = true
L5_1["psgetsid64.exe"] = true
L5_1["psinfo.exe"] = true
L5_1["psinfo64.exe"] = true
L5_1["pskill.exe"] = true
L5_1["pskill64.exe"] = true
L5_1["pslist.exe"] = true
L5_1["pslist64.exe"] = true
L5_1["psloggedon.exe"] = true
L5_1["psloggedon64.exe"] = true
L5_1["psloglist.exe"] = true
L5_1["psloglist64.exe"] = true
L5_1["pspasswd.exe"] = true
L5_1["pspasswd64.exe"] = true
L5_1["psping.exe"] = true
L5_1["psping64.exe"] = true
L5_1["psr.exe"] = true
L5_1["psservice.exe"] = true
L5_1["psservice64.exe"] = true
L5_1["psshutdown.exe"] = true
L5_1["pssuspend.exe"] = true
L5_1["pssuspend64.exe"] = true
L5_1["pwsh.exe"] = true
L5_1["rammap.exe"] = true
L5_1["rcsi.exe"] = true
L5_1["reg.exe"] = true
L5_1["regasm.exe"] = true
L5_1["regdelnull.exe"] = true
L5_1["regdelnull64.exe"] = true
L5_1["regedit.exe"] = true
L5_1["register-cimprovider"] = true
L5_1["regjump.exe"] = true
L5_1["regsvcs.exe"] = true
L5_1["regsvr32.exe"] = true
L5_1["replace.exe"] = true
L5_1["robocopy.exe"] = true
L5_1["roccat_swarm.exe"] = true
L5_1["rpcping.exe"] = true
L5_1["rundll32.exe"] = true
L5_1["runonce.exe"] = true
L5_1["runscripthelper.exe"] = true
L5_1["runtimebroker.exe"] = true
L5_1["sc.exe"] = true
L5_1["scriptrunner.exe"] = true
L5_1["sdelete.exe"] = true
L5_1["sdelete64.exe"] = true
L5_1["sdiagnhost.exe"] = true
L5_1["searchfilterhost.exe"] = true
L5_1["searchindexer.exe"] = true
L5_1["searchprotocolhost.exe"] = true
L5_1["securityhealthservice.exe"] = true
L5_1["services.exe"] = true
L5_1["settingsynchost.exe"] = true
L5_1["sgrmbroker.exe"] = true
L5_1["sigcheck.exe"] = true
L5_1["sigcheck64.exe"] = true
L5_1["sihost.exe"] = true
L5_1["smartscreen.exe"] = true
L5_1["smss.exe"] = true
L5_1["splwow64.exe"] = true
L5_1["spoolsv.exe"] = true
L5_1["sppsvc.exe"] = true
L5_1["sqldumper.exe"] = true
L5_1["sqlps.exe"] = true
L5_1["sqltoolsps.exe"] = true
L5_1["streams.exe"] = true
L5_1["streams64.exe"] = true
L5_1["surfacecolorservice.exe"] = true
L5_1["surfaceservice.exe"] = true
L5_1["svchost.exe"] = true
L5_1["syncappvpublishingserver.exe"] = true
L5_1["synchost.exe"] = true
L5_1["sysmon.exe"] = true
L5_1["sysmon64.exe"] = true
L5_1["systemsettingsbroker.exe"] = true
L5_1["taskhostw.exe"] = true
L5_1["taskmgr.exe"] = true
L5_1["tcpvcon.exe"] = true
L5_1["tcpview.exe"] = true
L5_1["te.exe"] = true
L5_1["tracker.exe"] = true
L5_1["usbinst.exe"] = true
L5_1["vboxdrvinst.exe"] = true
L5_1["vmcompute.exe"] = true
L5_1["vmmap.exe"] = true
L5_1["vmms.exe"] = true
L5_1["vsjitdebugger.exe"] = true
L5_1["vssvc.exe"] = true
L6_1 = true
L5_1["wab.exe"] = L6_1
L6_1 = "werfault.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "werfaultsecure.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wininit.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "winlogon.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "winobj.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "winword.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wmiapsrv.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wmic.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wmiprvse.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wscript.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wsmprovhost.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wuauclt.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "wudfhost.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = "xwizard.exe"
L7_1 = true
L5_1[L6_1] = L7_1
L6_1 = {}
L7_1 = "activeds.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "amsi.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "credui.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dbgeng.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dbghelp.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "diagtrack.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dpx.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dui70.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "duser.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dwmapi.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "dxgi.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "emet.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "fvewiz.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "hid.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "kernel32.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "mfc42u.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "oleacc.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "secur32.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "slc.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "spp.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "tapi32.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "user32.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "uxtheme.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "wer.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "winbio.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "winbrand.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "windowscoredeviceinfo.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "winmm.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "winsta.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "wldp.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "wtsapi32.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "xmllite.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = "unidrv.dll"
L8_1 = true
L6_1[L7_1] = L8_1
L7_1 = false
L8_1 = false
L9_1 = false
L10_1 = false
L11_1 = false
L12_1 = false
L13_1 = false
L16_1 = "gsub"
L15_1 = L4_1
L14_1 = L4_1[L16_1]
L16_1 = "%.exe%.mui"
L17_1 = ".exe"
L14_1 = L14_1(L15_1, L16_1, L17_1)
L4_1 = L14_1
L15_1 = L3_1
L14_1 = L3_1.find
L16_1 = "\\windows\\winsxs\\"
L17_1 = 1
L18_1 = true
L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
if not L14_1 then
  L15_1 = L3_1
  L14_1 = L3_1.find
  L16_1 = "\\\\$windows.~bt\\\\"
  L17_1 = 1
  L18_1 = true
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if not L14_1 then
    L15_1 = L3_1
    L14_1 = L3_1.find
    L16_1 = "\\windows\\softwaredistribution\\"
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if not L14_1 then
      L15_1 = L3_1
      L14_1 = L3_1.find
      L16_1 = "\\windows.old\\"
      L17_1 = 1
      L18_1 = true
      L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
      if not L14_1 then
        L15_1 = L3_1
        L14_1 = L3_1.find
        L16_1 = "\\\\winsehotfix\\hotfixes\\"
        L17_1 = 1
        L18_1 = true
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        if not L14_1 then
          L15_1 = L3_1
          L14_1 = L3_1.find
          L16_1 = "\\harddiskvolume.?.?.?\\windows"
          L14_1 = L14_1(L15_1, L16_1)
          if not L14_1 then
            L15_1 = L3_1
            L14_1 = L3_1.find
            L16_1 = "\\windows\\assembly\\nativeimages"
            L17_1 = 1
            L18_1 = true
            L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
            if not L14_1 then
              L15_1 = L3_1
              L14_1 = L3_1.find
              L16_1 = "windows\\ccm"
              L17_1 = 1
              L18_1 = true
              L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
              if not L14_1 then
                goto lbl_556
              end
            end
          end
        end
      end
    end
  end
end
L14_1 = mp
L14_1 = L14_1.set_mpattribute
L15_1 = "Lua:PeInExcludedOsPath"
L14_1(L15_1)
L8_1 = true
::lbl_556::
L15_1 = L3_1
L14_1 = L3_1.find
L16_1 = ":\\windows\\system32"
L17_1 = 1
L18_1 = true
L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
if not L14_1 then
  L15_1 = L3_1
  L14_1 = L3_1.find
  L16_1 = ":\\windows\\syswow64"
  L17_1 = 1
  L18_1 = true
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if not L14_1 then
    goto lbl_588
  end
end
L14_1 = mp
L14_1 = L14_1.set_mpattribute
L15_1 = "Lua:PeInSystemFolder"
L14_1(L15_1)
L9_1 = true
L15_1 = L3_1
L14_1 = L3_1.find
L16_1 = "\\spool"
L17_1 = 1
L18_1 = true
L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
if L14_1 then
  L9_1 = false
  L13_1 = true
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "Lua:PeInSpoolFolder"
  L14_1(L15_1)
end
::lbl_588::
L15_1 = L3_1
L14_1 = L3_1.find
L16_1 = "c:\\program files\\"
L17_1 = 1
L18_1 = true
L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
if not L14_1 then
  L15_1 = L3_1
  L14_1 = L3_1.find
  L16_1 = "c:\\program files (x86)\\"
  L17_1 = 1
  L18_1 = true
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if not L14_1 then
    goto lbl_607
  end
end
L14_1 = mp
L14_1 = L14_1.set_mpattribute
L15_1 = "Lua:PeInProgramsFolder"
L14_1(L15_1)
L10_1 = true
::lbl_607::
L14_1 = StringSplit
L15_1 = L4_1
L16_1 = "."
L14_1 = L14_1(L15_1, L16_1)
L15_1 = #L14_1
L15_1 = L14_1[L15_1]
L16_1 = #L14_1
L17_1 = 1
if L16_1 == L17_1 then
  L16_1 = mp
  L16_1 = L16_1.set_mpattribute
  L17_1 = "Lua:PeFileExtension!nil"
  L16_1(L17_1)
else
  L16_1 = nil
  if L15_1 ~= L16_1 then
    L16_1 = #L15_1
    L17_1 = 5
    if L16_1 > L17_1 then
      L18_1 = "sub"
      L17_1 = L15_1
      L16_1 = L15_1[L18_1]
      L18_1 = -5
      L16_1 = L16_1(L17_1, L18_1)
      L15_1 = L16_1 or L15_1
      if not L16_1 then
      end
    end
    L16_1 = mp
    L16_1 = L16_1.set_mpattribute
    L17_1 = "Lua:PeFileExtension!"
    L18_1 = L15_1
    L17_1 = L17_1 .. L18_1
    L16_1(L17_1)
  end
end
L18_1 = "gsub"
L17_1 = L4_1
L16_1 = L4_1[L18_1]
L18_1 = " "
L19_1 = "_"
L16_1 = L16_1(L17_1, L18_1, L19_1)
L17_1 = mp
L17_1 = L17_1.set_mpattribute
L18_1 = "Lua:PeFSFileName!"
L19_1 = L16_1
L18_1 = L18_1 .. L19_1
L17_1(L18_1)
L17_1 = "ProductName"
L17_1 = L0_1[L17_1]
L18_1 = ""
if L17_1 then
  L19_1 = string
  L20_1 = "lower"
  L19_1 = L19_1[L20_1]
  L20_1 = L17_1
  L19_1 = L19_1(L20_1)
  L17_1 = L19_1
  L21_1 = "gsub"
  L20_1 = L17_1
  L19_1 = L17_1[L21_1]
  L21_1 = "%.exe%.mui"
  L22_1 = ".exe"
  L19_1 = L19_1(L20_1, L21_1, L22_1)
  L17_1 = L19_1
  L21_1 = "gsub"
  L20_1 = L17_1
  L19_1 = L17_1[L21_1]
  L21_1 = " "
  L22_1 = "_"
  L19_1 = L19_1(L20_1, L21_1, L22_1)
  L18_1 = L19_1
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "Lua:PeProductName!"
  L21_1 = L18_1
  L20_1 = L20_1 .. L21_1
  L19_1(L20_1)
else
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "Lua:PeProductName!nil"
  L19_1(L20_1)
end
L19_1 = "InternalName"
L19_1 = L0_1[L19_1]
L20_1 = ""
if L19_1 then
  L21_1 = string
  L22_1 = "lower"
  L21_1 = L21_1[L22_1]
  L22_1 = L19_1
  L21_1 = L21_1(L22_1)
  L19_1 = L21_1
  L23_1 = "gsub"
  L22_1 = L19_1
  L21_1 = L19_1[L23_1]
  L23_1 = "%.exe%.mui"
  L24_1 = ".exe"
  L21_1 = L21_1(L22_1, L23_1, L24_1)
  L19_1 = L21_1
  L23_1 = "gsub"
  L22_1 = L19_1
  L21_1 = L19_1[L23_1]
  L23_1 = " "
  L24_1 = "_"
  L21_1 = L21_1(L22_1, L23_1, L24_1)
  L20_1 = L21_1
  L21_1 = mp
  L21_1 = L21_1.set_mpattribute
  L22_1 = "Lua:PeInternalName!"
  L23_1 = L20_1
  L22_1 = L22_1 .. L23_1
  L21_1(L22_1)
  if L19_1 ~= L4_1 then
    L21_1 = mp
    L21_1 = L21_1.set_mpattribute
    L22_1 = "Lua:PeInternalNameDiffFromFileName"
    L21_1(L22_1)
  else
    L21_1 = mp
    L21_1 = L21_1.set_mpattribute
    L22_1 = "Lua:PeInternalNameMatchedFileName"
    L21_1(L22_1)
  end
else
  L21_1 = mp
  L21_1 = L21_1.set_mpattribute
  L22_1 = "Lua:PeInternalName!nil"
  L21_1(L22_1)
end
L21_1 = "OriginalFilename"
L21_1 = L0_1[L21_1]
L22_1 = ""
if L21_1 then
  L23_1 = string
  L24_1 = "lower"
  L23_1 = L23_1[L24_1]
  L24_1 = L21_1
  L23_1 = L23_1(L24_1)
  L21_1 = L23_1
  L25_1 = "gsub"
  L24_1 = L21_1
  L23_1 = L21_1[L25_1]
  L25_1 = "%.exe%.mui"
  L26_1 = ".exe"
  L23_1 = L23_1(L24_1, L25_1, L26_1)
  L21_1 = L23_1
  L25_1 = "gsub"
  L24_1 = L21_1
  L23_1 = L21_1[L25_1]
  L25_1 = " "
  L26_1 = "_"
  L23_1 = L23_1(L24_1, L25_1, L26_1)
  L22_1 = L23_1
  L23_1 = mp
  L23_1 = L23_1.set_mpattribute
  L24_1 = "Lua:PeOriginalName!"
  L25_1 = L22_1
  L24_1 = L24_1 .. L25_1
  L23_1(L24_1)
  if L21_1 ~= L4_1 then
    L23_1 = mp
    L23_1 = L23_1.set_mpattribute
    L24_1 = "Lua:PeOriginalNameDiffFromFileName"
    L23_1(L24_1)
    L7_1 = true
  else
    L23_1 = mp
    L23_1 = L23_1.set_mpattribute
    L24_1 = "Lua:PeOriginalNameMatchedFileName"
    L23_1(L24_1)
  end
else
  L21_1 = "nil"
  L23_1 = mp
  L23_1 = L23_1.set_mpattribute
  L24_1 = "Lua:PeOriginalName!nil"
  L23_1(L24_1)
end
L23_1 = false
L24_1 = "exe"
if L15_1 == L24_1 then
  L24_1 = L5_1[L21_1]
  if not L24_1 then
    L24_1 = L5_1[L4_1]
    if not L24_1 then
      goto lbl_789
    end
  end
  L23_1 = true
end
::lbl_789::
L24_1 = "dll"
if L15_1 == L24_1 then
  L24_1 = L6_1[L21_1]
  if not L24_1 then
    L24_1 = L6_1[L4_1]
    if not L24_1 then
      goto lbl_799
    end
  end
  L23_1 = true
end
::lbl_799::
if L13_1 or L23_1 and not L8_1 then
  L24_1 = mp
  L25_1 = "IsTrustedFile"
  L24_1 = L24_1[L25_1]
  L24_1 = L24_1()
  if L24_1 then
    L12_1 = true
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeIsTrustedLolbin"
    L24_1(L25_1)
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeIsTrustedLolbin!"
    L26_1 = L21_1
    L25_1 = L25_1 .. L26_1
    L24_1(L25_1)
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeIsTrustedLolbinFile!"
    L26_1 = L4_1
    L25_1 = L25_1 .. L26_1
    L24_1(L25_1)
  else
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeUntrustedLolbin"
    L24_1(L25_1)
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeUnTrustedLolbin!"
    L26_1 = L21_1
    L25_1 = L25_1 .. L26_1
    L24_1(L25_1)
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeUnTrustedLolbinFile!"
    L26_1 = L4_1
    L25_1 = L25_1 .. L26_1
    L24_1(L25_1)
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:PeUntrustedLolbinExt!"
    L26_1 = L15_1
    L25_1 = L25_1 .. L26_1
    L24_1(L25_1)
  end
end
L24_1 = mp
L25_1 = "get_contextdata"
L24_1 = L24_1[L25_1]
L25_1 = mp
L26_1 = "CONTEXT_DATA_SCANREASON"
L25_1 = L25_1[L26_1]
L24_1 = L24_1(L25_1)
L25_1 = mp
L26_1 = "SCANREASON_ONMODIFIEDHANDLECLOSE"
L25_1 = L25_1[L26_1]
if L24_1 == L25_1 then
  L25_1 = mp
  L26_1 = "get_contextdata"
  L25_1 = L25_1[L26_1]
  L26_1 = mp
  L27_1 = "CONTEXT_DATA_NEWLYCREATEDHINT"
  L26_1 = L26_1[L27_1]
  L25_1 = L25_1(L26_1)
  L26_1 = true
  if L25_1 == L26_1 then
    L25_1 = string
    L26_1 = "lower"
    L25_1 = L25_1[L26_1]
    L26_1 = mp
    L27_1 = "get_contextdata"
    L26_1 = L26_1[L27_1]
    L27_1 = mp
    L28_1 = "CONTEXT_DATA_PROCESSNAME"
    L27_1 = L27_1[L28_1]
    L26_1, L27_1, L28_1, L29_1, L30_1 = L26_1(L27_1)
    L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1, L30_1)
    L11_1 = true
    L26_1 = mp
    L26_1 = L26_1.set_mpattribute
    L27_1 = "Lua:NewPeFile"
    L26_1(L27_1)
    L26_1 = mp
    L26_1 = L26_1.set_mpattribute
    L27_1 = "Lua:NewPeFile!"
    L28_1 = L4_1
    L27_1 = L27_1 .. L28_1
    L26_1(L27_1)
    L26_1 = #L25_1
    L27_1 = 38
    if L26_1 > L27_1 then
      L26_1 = mp
      L26_1 = L26_1.set_mpattribute
      L27_1 = "Lua:RtpProcNameTooLong"
      L26_1(L27_1)
    else
      L26_1 = mp
      L26_1 = L26_1.set_mpattribute
      L27_1 = "Lua:NewPeFileWrittenBy!"
      L28_1 = L25_1
      L27_1 = L27_1 .. L28_1
      L26_1(L27_1)
    end
    L27_1 = L25_1
    L26_1 = L25_1.find
    L28_1 = "rufus"
    L29_1 = 1
    L30_1 = true
    L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
    if L26_1 then
      L26_1 = mp
      L26_1 = L26_1.set_mpattribute
      L27_1 = "Lua:NewPeFileWrittenBy!rufus"
      L26_1(L27_1)
    end
    L26_1 = "mscorsvw.exe"
    if L25_1 == L26_1 then
      L28_1 = "match"
      L27_1 = L4_1
      L26_1 = L4_1[L28_1]
      L28_1 = "%.ni%.exe$"
      L26_1 = L26_1(L27_1, L28_1)
      if not L26_1 then
        L28_1 = "match"
        L27_1 = L4_1
        L26_1 = L4_1[L28_1]
        L28_1 = "%.ni%.dll$"
        L26_1 = L26_1(L27_1, L28_1)
        if not L26_1 then
          goto lbl_940
        end
      end
      L26_1 = mp
      L26_1 = L26_1.set_mpattribute
      L27_1 = "Lua:CleanFileWrittenBy!mscorsvw.exe"
      L26_1(L27_1)
    end
    ::lbl_940::
    if L23_1 and not L9_1 and not L8_1 and L7_1 then
      L26_1 = mp
      L26_1 = L26_1.set_mpattribute
      L27_1 = "MpDisableCaching"
      L26_1(L27_1)
    end
  end
end
L25_1 = "dll|ocx"
if L11_1 and not L9_1 and not L8_1 and not L12_1 and not L10_1 and L7_1 then
  L27_1 = L25_1
  L26_1 = L25_1.find
  L28_1 = L15_1
  L26_1 = L26_1(L27_1, L28_1)
  if L26_1 then
    L26_1 = mp
    L26_1 = L26_1.set_mpattribute
    L27_1 = "Lua:PossiblyForSideloading!"
    L28_1 = L4_1
    L27_1 = L27_1 .. L28_1
    L26_1(L27_1)
    L26_1 = mp
    L26_1 = L26_1.set_mpattribute
    L27_1 = "Lua:PeMonitorForSideload"
    L26_1(L27_1)
  end
end
L26_1 = mp
L27_1 = "INFECTED"
L26_1 = L26_1[L27_1]
return L26_1
