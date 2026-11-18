-- Threat: !InfrastructureShared
-- Name: 51b35c0a10aa
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if l_0_1 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_1, "T1083", "Discovery_File_Redirection_mt2023", 300)
reportRelatedBmHits()
return mp.INFECTED
