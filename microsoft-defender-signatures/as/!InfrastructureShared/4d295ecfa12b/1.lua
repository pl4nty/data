-- Threat: !InfrastructureShared
-- Name: 4d295ecfa12b
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
