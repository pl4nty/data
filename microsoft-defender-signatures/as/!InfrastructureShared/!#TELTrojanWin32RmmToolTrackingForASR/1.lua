-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/RmmToolTrackingForASR
-- Type: 8
-- Includes: HIPSRmmToolInfra

local l_0_0 = mp.GetScanSource()
if l_0_0 ~= mp.SCANSOURCE_IOAV_WEB and l_0_0 ~= mp.SCANSOURCE_IOAV_FILE and l_0_0 ~= mp.SCANSOURCE_RTP then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "putty", 1, true) ~= nil and versioning.IsSampled(99000, false, false, false) == true then
  return mp.CLEAN
end
if IsRmmToolFilePath(l_0_2) == true then
  return mp.INFECTED
end
if IsRmmToolVersionInfo(l_0_2) == true then
  return mp.INFECTED
end
if IsRmmToolOFN(l_0_2) == true then
  return mp.INFECTED
end
return mp.CLEAN
