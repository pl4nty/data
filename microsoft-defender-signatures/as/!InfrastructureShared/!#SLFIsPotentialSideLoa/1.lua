-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFIsPotentialSideLoa\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isappcontainer or peattributes.resource_only_dll or peattributes.no_ep or peattributes.dmg_entrypoint or peattributes.dmg_not_executable_image or peattributes.dmg_truncated then
  return mp.CLEAN
end
local l_0_0 = (mp.GetCertificateInfo)()
for l_0_4,l_0_5 in pairs(l_0_0) do
  if l_0_5.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_6, l_0_7 = pcall(mp.get_parent_filehandle)
if l_0_6 then
  l_0_6 = pcall(mp.get_filesize_by_handle, l_0_7)
  if l_0_6 then
    return mp.CLEAN
  end
end
local l_0_8 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_8 then
  return mp.CLEAN
end
l_0_8 = (string.lower)(l_0_8)
if (string.sub)(l_0_8, 1, 1) ~= "c" then
  return mp.CLEAN
end
if (string.find)(l_0_8, "program files", 1, true) ~= nil or (string.find)(l_0_8, "c:\\windows\\system32\\", 1, true) ~= nil or (string.find)(l_0_8, "c:\\windows\\syswow64\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_9 = (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME))
if l_0_9 == nil or (string.len)(l_0_9) > 20 then
  return mp.CLEAN
end
local l_0_10 = (mp.getfilesize)()
if l_0_10 < 256 or l_0_10 > 1048576 then
  return mp.CLEAN
end
local l_0_11 = {}
l_0_11["goopdate.dll"] = mp.INFECTED
l_0_11["mpsvc.dll"] = mp.INFECTED
l_0_11["mpclient.dll"] = mp.INFECTED
l_0_11["mpgear.dll"] = mp.INFECTED
l_0_11["iphlpapi.dll"] = mp.INFECTED
l_0_11["libcef.dll"] = mp.INFECTED
l_0_11["activeds.dll"] = mp.INFECTED
l_0_11["qclite.dll"] = mp.INFECTED
l_0_11["msimg32.dll"] = mp.INFECTED
l_0_11["aclmgr.dll"] = mp.INFECTED
l_0_11["rcdll.dll"] = mp.INFECTED
l_0_11["iscsiexe.dll"] = mp.INFECTED
l_0_11["iviewers.dll"] = mp.INFECTED
l_0_11["mscoree.dll"] = mp.INFECTED
l_0_11["version.dll"] = mp.INFECTED
l_0_11["cryptsp.dll"] = mp.INFECTED
l_0_11["msedgeupdate.dll"] = mp.INFECTED
l_0_11["msedge_elf.dll"] = mp.INFECTED
l_0_11["midlrtmd.dll"] = mp.INFECTED
l_0_11["duser.dll"] = mp.INFECTED
l_0_11["dllsafecheck.dll"] = mp.INFECTED
l_0_11["userenv.dll"] = mp.INFECTED
l_0_11["k7sysmn1.dll"] = mp.INFECTED
l_0_11["cryptbase.dll"] = mp.INFECTED
l_0_11["ncrypt.dll"] = mp.INFECTED
l_0_11["edputil.dll"] = mp.INFECTED
l_0_11["dbgeng.dll"] = mp.INFECTED
l_0_11["faultrep.dll"] = mp.INFECTED
l_0_11["wsock32.dll"] = mp.INFECTED
l_0_11["wintthp.dll"] = mp.INFECTED
l_0_11["dismcore.dll"] = mp.INFECTED
l_0_11["hccutils.dll"] = mp.INFECTED
l_0_11["x32bridge.dll"] = mp.INFECTED
l_0_11["wdsync.dll"] = mp.INFECTED
l_0_11["wdlocal.dll"] = mp.INFECTED
l_0_11["cnqmutil.dll"] = mp.INFECTED
l_0_11["hd-common.dll"] = mp.INFECTED
l_0_11["imobiehelper.dll"] = mp.INFECTED
l_0_11["toolsbag.dll"] = mp.INFECTED
l_0_11["mvvm.dll"] = mp.INFECTED
l_0_11["textshaping.dll"] = mp.INFECTED
l_0_11["mcvsocfg.dll"] = mp.INFECTED
l_0_11["netapi32.dll"] = mp.INFECTED
l_0_11["dsrole.dll"] = mp.INFECTED
l_0_11["sspicli.dll"] = mp.INFECTED
l_0_11["msftedit.dll"] = mp.INFECTED
l_0_11["format.dll"] = mp.INFECTED
l_0_11["webview2loader.dll"] = mp.INFECTED
l_0_11["winmm.dll"] = mp.INFECTED
l_0_11["brmod104.dll"] = mp.INFECTED
l_0_11["facesdk.dll"] = mp.INFECTED
l_0_11["dokan1.dll"] = mp.INFECTED
l_0_11["vdfvm17.dll"] = mp.INFECTED
l_0_11["dvusb.dll"] = mp.INFECTED
l_0_11["drivespan.dll"] = mp.INFECTED
l_0_11["gswdll32.dll"] = mp.INFECTED
l_0_11["vivaldi_elf.dll"] = mp.INFECTED
l_0_11["protectwow64.dll"] = mp.INFECTED
l_0_11["ceiinfolog.dll"] = mp.INFECTED
l_0_11["waveedit.dll"] = mp.INFECTED
l_0_11["mpamedia.dll"] = mp.INFECTED
l_0_11["coreclr.dll"] = mp.INFECTED
l_0_11["scanimageui.dll"] = mp.INFECTED
l_0_11["hpcustpartui.dll"] = mp.INFECTED
l_0_11["vina-cav3.dll"] = mp.INFECTED
l_0_11["mozglue.dll"] = mp.INFECTED
l_0_11["ccl80u.dll"] = mp.INFECTED
l_0_11["corefoundation.dll"] = mp.INFECTED
l_0_11["wtsapi32.dll"] = mp.INFECTED
l_0_11["ualapi.dll"] = mp.INFECTED
l_0_11["propsys.dll"] = mp.INFECTED
l_0_11["winmde.dll"] = mp.INFECTED
l_0_11["colorui.dll"] = mp.INFECTED
l_0_11["dui70.dll"] = mp.INFECTED
l_0_11["mi.dll"] = mp.INFECTED
l_0_11["winhttp.dll"] = mp.INFECTED
l_0_11["esent.dll"] = mp.INFECTED
l_0_11["wbemcomm.dll"] = mp.INFECTED
l_0_11["sxshared.dll"] = mp.INFECTED
l_0_11["winsync.dll"] = mp.INFECTED
l_0_11["ncobjapi.dll"] = mp.INFECTED
l_0_11["wlbsctrl.dll"] = mp.INFECTED
l_0_11["wmiclnt.dll"] = mp.INFECTED
l_0_11["vcruntime140.dll"] = mp.INFECTED
l_0_11["wwlib.dll"] = mp.INFECTED
l_0_11["vgauth.dll"] = mp.INFECTED
l_0_11["secur32.dll"] = mp.INFECTED
l_0_11["hpqhvsei.dll"] = mp.INFECTED
l_0_11["tosbtkbd.dll"] = mp.INFECTED
l_0_11["delevator64.dll"] = mp.INFECTED
l_0_11["vixdisklib.dll"] = mp.INFECTED
l_0_11["sbiedll.dll"] = mp.INFECTED
l_0_11["d3d8.dll"] = mp.INFECTED
l_0_11["sensapi.dll"] = mp.INFECTED
l_0_11["dxgi.dll"] = mp.INFECTED
l_0_11["fszwd.dat"] = mp.INFECTED
l_0_11["radcui.dll"] = mp.INFECTED
l_0_11["nethost.dll"] = mp.INFECTED
l_0_11["printui.dll"] = mp.INFECTED
l_0_11["wscapi.dll"] = mp.INFECTED
l_0_11["wininet.dll"] = mp.INFECTED
l_0_11["clink_dll_x86.dll"] = mp.INFECTED
l_0_11["ahni2t.dll"] = mp.INFECTED
l_0_11["safestore64.dll"] = mp.INFECTED
l_0_11["wchook.dkll"] = mp.INFECTED
l_0_11["libcurl.dll"] = mp.INFECTED
l_0_11["mspgimme.dll"] = mp.INFECTED
l_0_11["oledlg.dll"] = mp.INFECTED
l_0_11["systemsettings.dll"] = mp.INFECTED
l_0_11["printdialog.dll"] = mp.INFECTED
l_0_11["iumbase.dll"] = mp.INFECTED
l_0_11["avcodec-61.dll"] = mp.INFECTED
l_0_11["heif.dll"] = mp.INFECTED
l_0_11["libde265.dll"] = mp.INFECTED
l_0_11["sqlite3.dll"] = mp.LOWFI
l_0_11["ffmpeg.dll"] = mp.LOWFI
l_0_11["libvlc.dll"] = mp.LOWFI
l_0_11["jli.dll"] = mp.LOWFI
l_0_11["asus_wmi.dll"] = mp.LOWFI
l_0_11["wptsextensions.dll"] = mp.LOWFI
l_0_11["soldier.dll"] = mp.LOWFI
if l_0_11[l_0_9] and l_0_8 then
  (mp.set_mpattribute)("BM_IsPotentialSideLoad")
  ;
  (MpCommon.SetOriginalFileName)(l_0_8, "BM_IsPotentialSideLoad")
  local l_0_12 = "IsPotentialSideLoad"
  AppendToRollingQueue(l_0_12, l_0_8)
end
do
  if l_0_11[l_0_9] == mp.INFECTED then
    return mp.INFECTED
  else
    if l_0_11[l_0_9] == mp.LOWFI then
      return mp.LOWFI
    end
  end
  return mp.CLEAN
end

