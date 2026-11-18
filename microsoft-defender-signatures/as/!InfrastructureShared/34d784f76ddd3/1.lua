-- Threat: !InfrastructureShared
-- Name: 34d784f76ddd3
-- Type: 21

if mp.get_mpattribute("HSTR:IsVB6") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
