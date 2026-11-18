-- Threat: !InfrastructureShared
-- Name: 19b3c84c8c16
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$")
local l_0_2 = {
  "\\windows\\system32\\",
  "\\windows\\syswow64\\"
}
for l_0_3, l_0_4 in pairs(l_0_2) do
  if #l_0_1 > #l_0_4 and string.sub(l_0_1, -#l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
