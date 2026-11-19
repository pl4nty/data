-- Threat: !InfrastructureShared
-- Name: 280b32de48483
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = l_0_1.command_line
local l_0_3 = bm.get_imagepath()
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
end
if l_0_0 == nil or l_0_0 == "" or string.find(l_0_0, "/System/", 1, true) == 1 then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("[^/]*$")
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) or IsPersistenceExcludedMacOS(l_0_4, l_0_3, false) then
  return mp.CLEAN
end
if l_0_3:match("/%.[^/]+$") then
  bm.trigger_sig("ImagePathHiddenMacPersist", l_0_0)
end
if l_0_4 ~= nil and l_0_4 ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_4, true) then
  local l_0_5 = GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_4)
  if l_0_5 ~= nil and 0 < #l_0_5 then
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if l_0_7.value:match("/%.[^/]+$") then
        bm.trigger_sig("HiddenMacPersist", l_0_7.value)
      end
      if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_7.value) then
        if l_0_7.value:match("/%.[^/]+$") then
          bm.trigger_sig("HiddenUnsignedMacPersist", l_0_7.value)
        end
        bm.add_related_string("persisted_path", l_0_7.value, bm.RelatedStringBMReport)
        bm.add_related_file(l_0_7.value)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
