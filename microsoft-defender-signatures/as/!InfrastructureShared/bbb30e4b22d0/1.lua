-- Threat: !InfrastructureShared
-- Name: bbb30e4b22d0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].ppid
end
if l_0_0 ~= nil then
  if isParentPackageManager(l_0_0) then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
end
return mp.CLEAN
