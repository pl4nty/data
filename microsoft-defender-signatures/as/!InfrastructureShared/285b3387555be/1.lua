-- Threat: !InfrastructureShared
-- Name: 285b3387555be
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_0 then
  local l_0_1, l_0_2 = pcall(string.match, l_0_0, "fsize:(%d+)")
  if not l_0_1 or isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = tonumber(l_0_2)
  if l_0_2 and 1000 <= l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
