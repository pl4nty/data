-- Threat: !InfrastructureShared
-- Name: b2b350aa5742
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = versioning.GetOrgID()
local l_0_1 = {
  ["73a99e52-c380-4b86-9d47-fe1cb231f222"] = true,
  ["9d61afa0-cfa4-4746-95af-dc897a6f6774"] = true,
  ["8a2d9a03-1cd7-4b6a-9e63-6fb98b8c0e7a"] = true,
  ["24d4a9cf-e7f1-400a-b2d4-bd534e1e168d"] = true,
  ["a38396bc-49a9-4d9e-95a7-a7fdc4cdd463"] = true
}
if l_0_0 == nil or l_0_1[l_0_0] == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1620", "reflective_code_loading")
return mp.INFECTED
