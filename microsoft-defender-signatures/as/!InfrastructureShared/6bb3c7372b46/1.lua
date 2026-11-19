-- Threat: !InfrastructureShared
-- Name: 6bb3c7372b46
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].wp1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].wp1
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(mp.utf16to8(l_0_0))
  if string.find(l_0_1, "%(%d+gb%)%.lnk$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
