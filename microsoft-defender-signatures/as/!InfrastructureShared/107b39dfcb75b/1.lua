-- Threat: !InfrastructureShared
-- Name: 107b39dfcb75b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
local l_0_2 = {
  "install_acs_64.js"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  l_0_1 = string.match(l_0_0, "wscript.*%s+%\"?%'?(%w:\\.*%.js)")
end
if l_0_1 ~= nil then
  local l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if l_0_3 and sysio.IsFileExists(l_0_3) then
    local l_0_4, l_0_5 = mp.GetMotwZoneForFile(l_0_3)
    if l_0_4 and l_0_5 == 3 then
      bm.add_related_file(l_0_3)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
