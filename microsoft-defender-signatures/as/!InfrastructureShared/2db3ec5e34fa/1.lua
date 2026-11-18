-- Threat: !InfrastructureShared
-- Name: 2db3ec5e34fa
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
local l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
local l_0_2 = {
  "/google chrome$",
  "/microsoft edge$",
  "/brave browser$",
  "/opera$",
  "/chromedriver$",
  "/vivaldi$"
}
local l_0_3 = {
  "^/users/.+/library/application support/microsoft edge/default/preferences$",
  "^/users/.+/library/application support/vivaldi/default/preferences$",
  "^/users/.+/library/application support/com%.operasoftware%.opera/default/preferences$",
  "^/users/.+/library/application support/bravesoftware/brave%-browser/default/preferences$",
  "^/users/.+/library/application support/google/chrome/default/preferences$"
}
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_5) then
    return mp.CLEAN
  end
end
for l_0_6, l_0_7 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_7) then
    return mp.INFECTED
  end
end
return mp.CLEAN
