-- Threat: !InfrastructureShared
-- Name: 151b31b3a7c1b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true,
  ["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true,
  ["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true,
  ["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[4].matched then
  l_0_2 = "cmd"
elseif this_sigattrlog[5].matched then
  l_0_2 = "powershell"
elseif this_sigattrlog[6].matched then
  l_0_2 = "pwsh"
elseif this_sigattrlog[7].matched then
  l_0_2 = "mshta"
elseif this_sigattrlog[8].matched then
  l_0_2 = "certutil"
else
  return mp.CLEAN
end
bm.add_related_string("susp_iis_spawn_child", l_0_2, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1505.003", "iis_worker_susp_spawn", 28800)
return mp.INFECTED
