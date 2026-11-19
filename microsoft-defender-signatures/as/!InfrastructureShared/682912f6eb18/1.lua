-- Threat: !InfrastructureShared
-- Name: 682912f6eb18
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
