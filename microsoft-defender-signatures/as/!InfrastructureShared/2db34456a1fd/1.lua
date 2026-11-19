-- Threat: !InfrastructureShared
-- Name: 2db34456a1fd
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = false
local l_0_1
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 ~= nil and l_0_2.command_line ~= nil then
  local l_0_3 = string.lower(l_0_2.command_line)
  if string.find(l_0_3, "-ap \"msexchange", 1, true) then
    l_0_1 = l_0_3:match("-ap \"([^\"]+)\"")
    if l_0_1 ~= nil then
      l_0_0 = true
    end
  end
end
local l_0_4
if this_sigattrlog[2].matched then
  l_0_4 = this_sigattrlog[2].utf8p2
end
if l_0_4 ~= nil then
  l_0_4 = string.lower(l_0_4):match("lua:peoriginalname!(.*)$")
end
local l_0_5 = {}
if l_0_4 and l_0_0 then
  table.insert(l_0_5, {applicationname = l_0_1, modulename = l_0_4})
elseif l_0_4 and not l_0_0 then
  table.insert(l_0_5, {modulename = l_0_4})
end
if 0 < #l_0_5 then
  bm.add_related_string("InMemoryLoadBlocked", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
  bm.set_detection_string(safeJsonSerialize(l_0_5))
end
return mp.INFECTED
