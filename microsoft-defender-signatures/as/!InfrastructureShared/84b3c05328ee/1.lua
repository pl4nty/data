-- Threat: !InfrastructureShared
-- Name: 84b3c05328ee
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if not string.find(l_0_0, "\\windows mail\\", 1, true) then
  return mp.INFECTED
end
local l_0_2 = string.lower(l_0_1)
if string.sub(l_0_2, 1, 1) == "%" and string.find(l_0_2, "%commonprogramfiles%\\system", 1, true) then
  return mp.CLEAN
end
l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_1))
if not string.find(l_0_1, "\\outlook express\\", 1, true) then
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
