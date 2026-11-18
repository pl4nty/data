-- Threat: !InfrastructureShared
-- Name: 32b390b148d6
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if not string.find(l_0_2, "postgres -D ", 1, true) then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_0, "SrcIp=(%d+%.%d+%.%d+%.%d+);")
local l_0_4 = string.match(l_0_0, "SrcPort=(%d+);")
if l_0_3 == nil or l_0_3 == "" or l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = "postgres_connections_" .. l_0_3
local l_0_6 = l_0_3 .. "(" .. l_0_4 .. ")"
if MpCommon.QueryPersistContextNoPath(l_0_5, "cooldown") then
  return mp.CLEAN
end
MpCommon.AppendPersistContextNoPath(l_0_5, l_0_6, 3600)
return mp.CLEAN
