-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/DllOnMountedDrive
-- Type: 10
-- MpAttributes: MpFileIsOnRemovableDrive & BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 == "" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_4 = mp.getfilesize()
if l_0_1 == "keyvaultfx.exe" and string.find(l_0_2, "\\netlock\\", 1, true) or l_0_1 == "netlock.exe" and string.find(l_0_2, "\\netlock\\", 1, true) or l_0_1 == "ptlite10.exe" and string.find(l_0_2, "\\ptlite10\\", 1, true) or string.find(l_0_2, "\\ptlres10", 1, true) or string.find(l_0_1, "rufus", 1, true) and string.find(l_0_2, "windows\\winsxs", 1, true) and l_0_4 < 11000 or l_0_1 == "regsvr32.exe" and (string.find(l_0_2, "lav filters", 1, true) and l_0_3:sub(-3) == ".ax" or string.find(l_0_2, "checkver.ocx", 1, true) and l_0_4 == 306256 or string.find(l_0_2, "diswhql.dll", 1, true) and l_0_4 == 6205440 or string.find(l_0_2, "melsoft\\gx works2", 1, true)) or string.find(l_0_1, "virtualbench.exe", 1, true) and string.find(l_0_2, "nationalinstruments", 1, true) or l_0_1 == "start.exe" and (string.find(l_0_3, "rtpkcs11ecp.dll", 1, true) or string.find(l_0_3, "libssl-1_1.dll", 1, true) or string.find(l_0_3, "rtengine.dll", 1, true) or string.find(l_0_3, "libcrypto-1_1.dll", 1, true)) and l_0_4 < 3000000 then
  return mp.CLEAN
end
local l_0_5
if l_0_1 ~= "rundll32.exe" and l_0_1 ~= "regsvr32.exe" then
  local l_0_6 = l_0_0 .. "\\" .. l_0_1
  l_0_5 = MpCommon.GetOriginalFileName(l_0_6)
end
local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_ATTRIBUTES)
local l_0_8 = mp.bitand(l_0_7, 2)
local l_0_9 = l_0_3:sub(-3):lower()
if l_0_8 == 0 then
  mp.set_mpattribute("Lua:Context/DllOnMountedDrive")
  if l_0_1 == "regsvr32.exe" or l_0_5 ~= nil and l_0_5 == "regsvr32.exe" then
    if l_0_9 ~= "dll" and l_0_9 ~= "ocx" and l_0_9 ~= ".ax" then
      if l_0_1 ~= "regsvr32.exe" then
        mp.set_mpattribute("Lua:Context/VerySuspiciousMountedDriveDllRegsvrLoad")
      else
        mp.set_mpattribute("Lua:Context/SuspiciousMountedDriveDllRegsvrLoad")
      end
    else
      mp.set_mpattribute("Lua:Context/MountedDriveDllRegsvrLoad")
    end
  elseif l_0_1 == "rundll32.exe" or l_0_5 ~= nil and l_0_5 == "rundll32.exe" then
    if l_0_9 ~= "dll" and l_0_9 ~= "ocx" then
      if l_0_1 ~= "rundll32.exe" then
        mp.set_mpattribute("Lua:Context/VerySuspiciousMountedDriveDllRundllLoad")
      else
        mp.set_mpattribute("Lua:Context/SuspiciousMountedDriveDllRundllLoad")
      end
    else
      mp.set_mpattribute("Lua:Context/MountedDriveDllRundllLoad")
    end
  end
  if l_0_0:find("\\device\\cdrom", 1, true) ~= nil then
    mp.set_mpattribute("Lua:Context/MaybeDllSideLoadingOnMountedDrive")
  end
else
  if l_0_1 == "regsvr32.exe" or l_0_5 ~= nil and l_0_5 == "regsvr32.exe" then
    if l_0_9 ~= "dll" and l_0_9 ~= "ocx" then
      if l_0_1 ~= "regsvr32.exe" then
        mp.set_mpattribute("Lua:Context/VerySuspiciousMountedDriveHiddenDllRegsvrLoad")
      else
        mp.set_mpattribute("Lua:Context/SuspiciousMountedDriveHiddenDllRegsvrLoad")
      end
    else
      mp.set_mpattribute("Lua:Context/MountedDriveHiddenDllRegsvrLoad")
    end
  elseif l_0_1 == "rundll32.exe" or l_0_5 ~= nil and l_0_5 == "rundll32.exe" then
    if l_0_9 ~= "dll" and l_0_9 ~= "ocx" then
      if l_0_1 ~= "rundll32.exe" then
        mp.set_mpattribute("Lua:Context/VerySuspiciousMountedDriveHiddenDllRundllLoad")
      else
        mp.set_mpattribute("Lua:Context/SuspiciousMountedDriveHiddenDllRundllLoad")
      end
    else
      mp.set_mpattribute("Lua:Context/MountedDriveHiddenDllRundllLoad")
    end
  end
  mp.set_mpattribute("Lua:Context/HiddenDllOnMountedDrive")
  if l_0_0:find("\\device\\cdrom", 1, true) ~= nil then
    mp.set_mpattribute("Lua:Context/MaybeHiddenDllSideLoadingOnMountedDrive")
  end
end
return mp.CLEAN
