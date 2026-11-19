-- Threat: !InfrastructureShared
-- Name: 4e29a0ec6d2d
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
