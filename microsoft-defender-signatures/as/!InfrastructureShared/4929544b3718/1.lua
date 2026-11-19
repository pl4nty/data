-- Threat: !InfrastructureShared
-- Name: 4929544b3718
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
