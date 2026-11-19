-- Threat: !InfrastructureShared
-- Name: 32b3533ed542
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2 = 1
local l_0_3 = 10
local l_0_4 = 20
local l_0_5 = 100
local l_0_6 = "Scan_"
local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13
l_0_1 = this_sigattrlog[1].utf8p2
l_0_8 = string.match(l_0_1, "DestIp=([^;]*);")
l_0_9 = string.match(l_0_1, "DestPort=([^;]*);")
if l_0_8 == nil or l_0_8 == "" or l_0_9 == nil or l_0_9 == "" then
  return mp.CLEAN
end
local l_0_14 = bm.get_current_process_startup_info()
if l_0_14 and l_0_14.ppid then
  l_0_0 = l_0_14.ppid
else
  return mp.CLEAN
end
l_0_7 = l_0_6 .. l_0_0
l_0_10, l_0_11 = pcall(MpCommon.RollingQueueCreate, l_0_7, l_0_5, l_0_2)
if not l_0_10 then
  return mp.CLEAN
end
l_0_10, l_0_11 = pcall(MpCommon.RollingQueueQueryMultiKey, l_0_7, l_0_8)
if not l_0_10 then
  return mp.CLEAN
end
if l_0_11 and type(l_0_11) == "table" then
  for l_0_15, l_0_16 in pairs(l_0_11) do
    if l_0_16 and l_0_16.value == l_0_9 then
      return mp.CLEAN
    end
  end
end
l_0_10, l_0_11 = pcall(MpCommon.RollingQueueAppend, l_0_7, l_0_8, l_0_9, l_0_2)
if not l_0_10 then
  return mp.CLEAN
end
l_0_10, l_0_11 = pcall(MpCommon.RollingQueueCountOfUniqueKeys, l_0_7)
if not l_0_10 then
  return mp.CLEAN
end
l_0_12 = l_0_11
l_0_10, l_0_11 = pcall(MpCommon.RollingQueueCount, l_0_7)
if not l_0_10 then
  return mp.CLEAN
end
l_0_13 = l_0_11 / l_0_12
if l_0_3 < l_0_12 or l_0_4 < l_0_13 then
  TrackPidAndTechniqueBM(l_0_0, "T1046", "Discovery_NetworkScanning")
  l_0_10, l_0_11 = pcall(MpCommon.RollingQueueErase, l_0_7)
  return mp.INFECTED
end
return mp.CLEAN
