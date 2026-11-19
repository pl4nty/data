-- Threat: !InfrastructureShared
-- Name: 55406e01334f
-- Type: 21

if mp.get_mpattribute("NID:Win64/Hagcons.Z!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
