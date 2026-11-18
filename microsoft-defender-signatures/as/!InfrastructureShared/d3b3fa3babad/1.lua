-- Threat: !InfrastructureShared
-- Name: d3b3fa3babad
-- Type: 21

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
else
  return mp.CLEAN
end
if l_0_0 ~= nil and (string.match(l_0_0, "/addfile [^ ]+ \\\\localhost\\[^ ]* [^ ]+") ~= nil or string.match(l_0_0, "/addfile [^ ]+ \\\\127%.0%.0%.1\\[^ ]* [^ ]+") ~= nil or string.match(l_0_0, "/addfile [^ ]+ .:\\[^ ]* [^ ]+") ~= nil or string.match(l_0_0, "/addfile [^ ]+ http[s]?%:%/%/[^ ]* [^ ]+") ~= nil) then
  local l_0_1 = l_0_0:match("[^ ]*$")
  local l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_1))
  bm.add_related_file(l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
