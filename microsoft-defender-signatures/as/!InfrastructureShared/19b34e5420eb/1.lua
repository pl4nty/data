-- Threat: !InfrastructureShared
-- Name: 19b34e5420eb
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p1 == nil or this_sigattrlog[1].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = {
  "/private/tmp/",
  "/users/shared/",
  "/library/caches/",
  "/var/tmp/"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if StringStartsWith(string.lower(l_0_0), l_0_3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
