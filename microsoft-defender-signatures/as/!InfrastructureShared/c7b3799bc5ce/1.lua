-- Threat: !InfrastructureShared
-- Name: c7b3799bc5ce
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "psexesvc", 1, true) or string.find(l_0_0, "batchpatchexesvc", 1, true) then
  return mp.CLEAN
end
Has_NetworkLogonSuccess(true)
return mp.INFECTED
