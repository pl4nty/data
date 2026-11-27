-- Threat: !InfrastructureShared
-- Name: e3d7a6bc9f6f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match(" [%w._%+%-]+@([%w%.%-]+%.[%a]+)")
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = "http://" .. l_0_2
local l_0_3 = {}
l_0_3.SIG_CONTEXT = "CMD"
l_0_3.CONTENT_SOURCE = "FINGER_CMDLINE"
l_0_3.PROCESS_CONTEXT = "finger.exe"
l_0_3.FILELESS = "true"
l_0_3.CMDLINE_URL = "true"
local l_0_4, l_0_5 = ExtractUrlGetReputation(l_0_2, l_0_3, true, 2, 60, false, 3000)
if l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
