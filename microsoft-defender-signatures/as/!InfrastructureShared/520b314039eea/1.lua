-- Threat: !InfrastructureShared
-- Name: 520b314039eea
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[20].matched and this_sigattrlog[20].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[20].utf8p2
elseif this_sigattrlog[21].matched and this_sigattrlog[21].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[21].utf8p2
elseif this_sigattrlog[22].matched and this_sigattrlog[22].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[22].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = false
if IsKeyInRollingQueue("enum_script_attributes", l_0_0, true) then
  local l_0_2 = GetRollingQueueAsHashTable("enum_script_attributes")
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = StringSplit(l_0_2[l_0_0], "|")
  if l_0_3 ~= nil or 0 < #l_0_3 then
    for l_0_4 = 1, #l_0_3 do
      local l_0_5 = "BM_ContentAttribs:" .. l_0_3[l_0_4]
      bm.trigger_sig(l_0_5, l_0_0)
    end
    l_0_1 = true
  end
end
if IsKeyInRollingQueue("enum_bm_attributes", l_0_0, true) then
  local l_0_6 = GetRollingQueueAsHashTable("enum_bm_attributes")
  if l_0_6 == nil then
    return mp.CLEAN
  end
  local l_0_7 = StringSplit(l_0_6[l_0_0], "|")
  if l_0_7 ~= nil or 0 < #l_0_7 then
    for l_0_8 = 1, #l_0_7 do
      local l_0_9 = "BM_ContentAttribs:" .. l_0_7[l_0_8]
      bm.trigger_sig(l_0_9, l_0_0)
    end
    l_0_1 = true
  end
end
if l_0_1 == false then
  return mp.CLEAN
end
return mp.INFECTED
