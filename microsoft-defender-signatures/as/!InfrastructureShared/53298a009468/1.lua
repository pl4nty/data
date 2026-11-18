-- Threat: !InfrastructureShared
-- Name: 53298a009468
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
