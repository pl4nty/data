-- Threat: !InfrastructureShared
-- Name: 532920734a75
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
