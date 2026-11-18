-- Threat: !InfrastructureShared
-- Name: 41b387821c1c
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = "^(\\\\[^\\]+\\[^\\]+)"
    if string.match(l_0_3, l_0_4) or string.find(l_0_3, "EngagementsCHU.vbs", 1, true) or string.find(l_0_3, "EnginCHU.vbs", 1, true) or string.find(l_0_3, "PACS_Launcher.vbs", 1, true) then
      return mp.CLEAN
    end
  end
end
local l_0_5
if this_sigattrlog[2].matched then
  l_0_5 = this_sigattrlog[2].utf8p1
end
local l_0_6 = string.lower(l_0_5)
if not l_0_5 or not l_0_6:match("hkcu\\software\\[^\\]+$") then
  return mp.CLEAN
end
local l_0_7, l_0_8
if this_sigattrlog[3].matched then
  l_0_7 = this_sigattrlog[3].utf8p2
  l_0_8 = this_sigattrlog[3].utf8p1
end
if l_0_8 then
  l_0_8 = string.lower(l_0_8)
  if string.find(l_0_8, l_0_6) and l_0_7 ~= nil and 1000 < #l_0_7 then
    return mp.INFECTED
  end
end
return mp.CLEAN
