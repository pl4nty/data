-- Threat: !InfrastructureShared
-- Name: !#Lua:VbsMLCloudExclusion
-- Type: 13

if mp.get_mpattributesubstring("VbsMLCloudExclusion") then
  return mp.INFECTED
end
return mp.CLEAN
