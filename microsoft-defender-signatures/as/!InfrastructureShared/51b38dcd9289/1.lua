-- Threat: !InfrastructureShared
-- Name: 51b38dcd9289
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine("BM", nil, nil, 6)
return mp.INFECTED
