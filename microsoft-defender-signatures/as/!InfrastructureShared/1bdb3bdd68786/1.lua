-- Threat: !InfrastructureShared
-- Name: 1bdb3bdd68786
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_2 and string.len(l_0_2) < 500 then
  return mp.CLEAN
end
local l_0_3 = {
  "install_acs_64.js"
}
if contains(l_0_0, l_0_3) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  l_0_1 = string.match(l_0_0, "wscript.*%s+%\"?%'?(%w:\\.*%.js)")
end
if l_0_1 ~= nil then
  local l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if l_0_4 and sysio.IsFileExists(l_0_4) then
    local l_0_5, l_0_6 = mp.GetMotwZoneForFile(l_0_4)
    if l_0_5 and l_0_6 == 3 then
      bm.add_threat_file(l_0_4)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
