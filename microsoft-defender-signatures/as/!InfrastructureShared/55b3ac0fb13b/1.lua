-- Threat: !InfrastructureShared
-- Name: 55b3ac0fb13b
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_0 = string.gsub(l_0_0, "\"", "")
  l_0_0 = string.gsub(l_0_0, "%s+$", "")
  local l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
  if l_0_0 == l_0_1 then
    if string.find(l_0_0, "c:\\users\\", 1, true) or string.find(l_0_0, "c:\\programdata\\", 1, true) or string.find(l_0_0, "\\kmspico\\", 1, true) then
      AppendToRollingQueue("Rugmigen_Parent", l_0_0, 1, 30)
      bm.add_threat_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
