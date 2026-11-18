-- Threat: !InfrastructureShared
-- Name: Esendi
-- Type: 14

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%ALLUSERSPROFILE%")
sysio.StopService("bits")
if Info.OSMajorVersion > 6 then
  sysio.DeleteFile(l_0_0 .. "\\Microsoft\\Network\\Downloader\\qmgr.db")
else
  sysio.DeleteFile(l_0_0 .. "\\Microsoft\\Network\\Downloader\\qmgr0.db")
  sysio.DeleteFile(l_0_0 .. "\\Microsoft\\Network\\Downloader\\qmgr1.db")
end
