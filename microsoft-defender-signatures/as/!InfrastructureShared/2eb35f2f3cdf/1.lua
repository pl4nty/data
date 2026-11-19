-- Threat: !InfrastructureShared
-- Name: 2eb35f2f3cdf
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) then
  return mp.CLEAN
end
if TrackCustomPersistContextNameByPPID("query", "bm", "MimikatzTrigger") == true then
  return mp.INFECTED
end
return mp.CLEAN
