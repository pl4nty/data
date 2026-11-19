-- Threat: !InfrastructureShared
-- Name: d6b3a3ddc9eb
-- Type: 21
-- Includes: BMLuaLib

if IsADFSRole() then
  return mp.INFECTED
end
return mp.CLEAN
