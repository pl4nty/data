-- Threat: !InfrastructureShared
-- Name: 7bb3e9019afd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
local l_0_1 = false
local l_0_2 = this_sigattrlog[2]
if l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p2) then
  l_0_0 = l_0_2.utf8p2
  l_0_1 = true
end
l_0_2 = this_sigattrlog[1]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p2) then
  l_0_0 = l_0_2.utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_0)
local l_0_5 = string.find(l_0_3, "openclaw", 1, true) ~= nil
local l_0_7 = string.find(l_0_3, "jsonrpc", 1, true) ~= nil
local l_0_8 = contains(l_0_3, {
  "/mcp",
  " mcp",
  "mcp-server",
  "mcp_servers",
  "mcp-servers",
  "tools/list",
  "tools/call",
  "notifications/initialized",
  "initialize"
}, true)
local l_0_9 = contains(l_0_3, {"http://", "https://"}, true)
if l_0_1 and not l_0_5 then
  return mp.CLEAN
end
if not l_0_7 then
  return mp.CLEAN
end
if not l_0_8 then
  return mp.CLEAN
end
if not l_0_9 then
  return mp.CLEAN
end
bm.add_related_string("openclaw_mcp_channel", "jsonrpc_http", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1102", "openclaw_mcp_channel", 28800)
add_parents()
return mp.INFECTED
