-- Threat: !InfrastructureShared
-- Name: 70b368dfe2e2
-- Type: 21
-- Includes: AppomalyHelpers, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  local l_0_0 = this_sigattrlog[2].utf8p2
  l_0_0 = urlDecode(l_0_0)
  local l_0_1 = "?url=(.*)"
  local l_0_2 = string.match(l_0_0, l_0_1)
  l_0_2 = l_0_2 or string.match(l_0_0, "(https?://.*)")
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = urlDecode(l_0_2)
  local l_0_3 = string.match(l_0_2, ".sharepoint.com/:%w:/%w/personal/(.-)/") or string.match(l_0_2, ".sharepoint.com/:%w:/%w/sites/(.-)/") or string.match(l_0_2, ".sharepoint.com/:%w:/%w/(.-)/") or ""
  local l_0_4 = this_sigattrlog[2].utf8p1:match("([^\\]+)$") or ""
  local l_0_5 = 1800
  local l_0_6 = 100
  local l_0_7 = l_0_4 .. "->" .. l_0_2 .. "->" .. l_0_3
  AppendToRollingQueue("TEAMS_Download", "ClickedLink", l_0_7, l_0_5, l_0_6, 0)
end
return mp.CLEAN
