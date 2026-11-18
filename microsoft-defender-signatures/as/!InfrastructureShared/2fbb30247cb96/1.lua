-- Threat: !InfrastructureShared
-- Name: 2fbb30247cb96
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = bm.get_imagepath()
local l_0_3 = l_0_1.command_line
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[9].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 == nil or l_0_0 == "" or string.find(l_0_0, "/System/", 1, true) == 1 then
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

local l_0_4 = l_0_0:match("[^/]*$")
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_2) or IsPersistenceExcludedMacOS(l_0_4, l_0_2, false) then
  return mp.CLEAN
end
if l_0_4 ~= nil and l_0_4 ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_4, true) then
  local l_0_5 = GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_4)
  if l_0_5 ~= nil and 0 < #l_0_5 then
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if ExtendedSuspMacPathsToMonitor(l_0_7.value) and not IsPersistenceExcludedMacOS(l_0_4, l_0_7.value, true) then
        bm.add_related_file(l_0_7.value)
        bm.add_related_string("persisted_path", l_0_7.value, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
