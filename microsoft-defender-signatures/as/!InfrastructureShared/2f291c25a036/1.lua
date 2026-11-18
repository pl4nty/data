-- Threat: !InfrastructureShared
-- Name: 2f291c25a036
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
