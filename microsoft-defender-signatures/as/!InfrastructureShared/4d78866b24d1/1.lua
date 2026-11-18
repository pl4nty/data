-- Threat: !InfrastructureShared
-- Name: 4d78866b24d1
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
