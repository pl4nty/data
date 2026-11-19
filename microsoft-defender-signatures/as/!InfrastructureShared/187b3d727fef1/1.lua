-- Threat: !InfrastructureShared
-- Name: 187b3d727fef1
-- Type: 21
-- Includes: BMLuaLib

if IsActiveDirectoryRole() then
  return mp.INFECTED
end
return mp.CLEAN
