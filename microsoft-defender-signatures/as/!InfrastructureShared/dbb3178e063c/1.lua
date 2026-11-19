-- Threat: !InfrastructureShared
-- Name: dbb3178e063c
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if not sysio.IsFileExists(l_0_0) then
    return mp.CLEAN
  end
  local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
  if l_0_1 == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
