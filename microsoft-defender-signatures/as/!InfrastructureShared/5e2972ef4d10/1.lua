-- Threat: !InfrastructureShared
-- Name: 5e2972ef4d10
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
