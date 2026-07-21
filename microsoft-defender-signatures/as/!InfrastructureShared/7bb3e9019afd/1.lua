-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bb3e9019afd\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = false
-- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

if this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched and not isnull((this_sigattrlog[2]).utf8p2) then
  l_0_1 = (this_sigattrlog[2]).utf8p2
  l_0_2 = true
end
-- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

if l_0_1 == nil and this_sigattrlog[1] ~= nil and (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p2) then
  l_0_1 = (this_sigattrlog[1]).utf8p2
end
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_3 = nil
local l_0_9 = nil
local l_0_10 = (string.find)((string.lower)(l_0_1), "openclaw", 1, true) ~= nil
local l_0_11 = (string.find)((string.lower)(l_0_1), "jsonrpc", 1, true) ~= nil
do
  local l_0_12 = contains(l_0_9, {"/mcp", " mcp", "mcp-server", "mcp_servers", "mcp-servers", "tools/list", "tools/call", "notifications/initialized", "initialize"}, true)
  if l_0_2 and not l_0_10 then
    return mp.CLEAN
  end
  if not l_0_11 then
    return mp.CLEAN
  end
  if not l_0_12 then
    return mp.CLEAN
  end
  if not contains(l_0_9, {"http://", "https://"}, true) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("openclaw_mcp_channel", "jsonrpc_http", bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1102", "openclaw_mcp_channel", 28800)
  add_parents()
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

