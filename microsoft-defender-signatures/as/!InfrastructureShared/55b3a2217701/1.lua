-- Threat: !InfrastructureShared
-- Name: 55b3a2217701
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = "^(\\\\[^\\]+\\[^\\]+)"
    l_0_3 = string.lower(l_0_3)
    if string.match(l_0_3, l_0_4) or string.find(l_0_3, "engagementschu.vbs", 1, true) or string.find(l_0_3, "enginchu.vbs", 1, true) or string.find(l_0_3, "pacs_launcher.vbs", 1, true) or string.find(l_0_3, "fidelity", 1, true) or string.find(l_0_3, "bginfo", 1, true) or string.find(l_0_3, "favoris_explorer", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_5
  if this_sigattrlog[4].matched then
    l_0_5 = this_sigattrlog[4].utf8p1
  end
  local l_0_6 = string.lower(l_0_5)
  if not l_0_5 or not l_0_6:match("hkcu\\software\\[^\\]+$") then
    return mp.CLEAN
  end
  AppendToRollingQueue("big_reg_write", l_0_6, "found", 600)
end
return mp.CLEAN
