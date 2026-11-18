-- Threat: !InfrastructureShared
-- Name: 68ab35fd61c83
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = 1800000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_1 = {
  "MpNewlyCreatedHint_2h"
}
local l_0_2 = ".ps1"
bm_AddRelatedFileFromCommandLine("BM", l_0_2, nil, 35, l_0_1)
return mp.INFECTED
