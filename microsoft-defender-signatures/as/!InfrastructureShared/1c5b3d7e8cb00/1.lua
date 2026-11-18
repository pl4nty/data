-- Threat: !InfrastructureShared
-- Name: 1c5b3d7e8cb00
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
  if l_0_1 == true then
    return mp.CLEAN
  end
end
return mp.INFECTED
