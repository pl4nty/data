-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a34184bc016e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = (string.find)(l_0_1, "\r\n", 1, true)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (string.find)(l_0_2, "cookie:", 1, true)
local l_0_5 = (string.find)(l_0_2, "whostmgrsession", 1, true)
if not l_0_4 or not l_0_5 then
  return mp.CLEAN
end
l_0_0.NRI_RequestBlob = tohex(l_0_1)
;
(nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED

