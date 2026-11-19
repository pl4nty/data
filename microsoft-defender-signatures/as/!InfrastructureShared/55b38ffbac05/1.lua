-- Threat: !InfrastructureShared
-- Name: 55b38ffbac05
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].timestamp
end
if this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].timestamp
end
local l_0_3
if this_sigattrlog[3].matched then
  l_0_3 = this_sigattrlog[3].utf8p1
end
if l_0_3 == nil or not string.find(l_0_3, "\\inetcache\\content.mso", 1, true) then
  return mp.CLEAN
end
if l_0_1 < l_0_2 and l_0_2 - l_0_1 <= 30000000 then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    bm.add_threat_file(l_0_6)
  end
  return mp.INFECTED
end
return mp.CLEAN
