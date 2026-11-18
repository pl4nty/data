-- Threat: !InfrastructureShared
-- Name: 73b337fe1794
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" then
  l_0_1 = this_sigattrlog[2].utf8p1
  l_0_2 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) or IsPersistenceExcludedMacOS(l_0_0, l_0_1, false) then
  return mp.CLEAN
end

function ExtendedSuspMacPathsToMonitor(l_1_0)
  if SuspMacPathsToMonitor(l_1_0, true) then
    return true
  end
  if l_1_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_1_0:find("^/Users/[^/]+/Documents/", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
  return mp.CLEAN
end
local l_0_3 = l_0_0:match("[^/]*$")
if l_0_3 ~= nil and l_0_3 ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_3, true) then
  local l_0_4 = GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_3)
  if l_0_4 ~= nil and 0 < #l_0_4 then
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      if ExtendedSuspMacPathsToMonitor(l_0_6.value) then
        bm.add_related_string("persisted_path", l_0_6.value, bm.RelatedStringBMReport)
        bm.add_related_file(l_0_6.value)
        if sysio.IsFileExists(l_0_6.value) then
          bm.add_threat_file(l_0_6.value)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
