-- Threat: !InfrastructureShared
-- Name: af78abdedd50
-- Type: 21

if mp.get_mpattribute("NID:Golang") then
  return mp.INFECTED
end
return mp.CLEAN
