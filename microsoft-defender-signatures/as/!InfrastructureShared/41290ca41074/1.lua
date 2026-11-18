-- Threat: !InfrastructureShared
-- Name: 41290ca41074
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
