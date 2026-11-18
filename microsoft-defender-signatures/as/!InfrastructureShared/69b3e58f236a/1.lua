-- Threat: !InfrastructureShared
-- Name: 69b3e58f236a
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(string.lower(this_sigattrlog[4].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$")
local l_0_2 = {
  "\\windows\\system32\\"
}
for l_0_3, l_0_4 in pairs(l_0_2) do
  if #l_0_1 > #l_0_4 and string.sub(l_0_1, -#l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
return mp.INFECTED
