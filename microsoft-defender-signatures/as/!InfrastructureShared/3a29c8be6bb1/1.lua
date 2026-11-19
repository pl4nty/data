-- Threat: !InfrastructureShared
-- Name: 3a29c8be6bb1
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
