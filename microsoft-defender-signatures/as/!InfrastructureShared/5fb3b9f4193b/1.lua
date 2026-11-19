-- Threat: !InfrastructureShared
-- Name: 5fb3b9f4193b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 15 then
  return mp.CLEAN
end
local l_0_1 = {
  "/s",
  "/m",
  "password",
  ">"
}
for l_0_2, l_0_3 in pairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) == nil then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_4 = string.lower(this_sigattrlog[1].utf8p2)
  if 1 < #l_0_4 then
    bm_AddRelatedFileFromCommandLine(l_0_4, nil, nil, 1)
  end
end
return mp.INFECTED
