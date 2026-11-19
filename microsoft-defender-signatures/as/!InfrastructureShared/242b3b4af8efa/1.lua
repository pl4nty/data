-- Threat: !InfrastructureShared
-- Name: 242b3b4af8efa
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[4].utf8p1
  l_0_2 = this_sigattrlog[4].utf8p2
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) or IsPersistenceExcludedMacOS(l_0_0, l_0_1, false) then
  return mp.CLEAN
end
if l_0_2:find("mtxsetup -log /private/tmp/", 1, true) then
  return mp.CLEAN
end
if l_0_0:match("/Int%-Test%d+%.plist$") ~= nil and l_0_1:match("^/private/tmp/Int%-Test%d+/msp%-agent%-core$") ~= nil then
  return mp.CLEAN
end
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" or string.find(l_0_0, "/System/", 1, true) == 1 then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
  bm.add_related_file(l_0_1)
  bm.trigger_sig("AdhocPersistMacOS", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
