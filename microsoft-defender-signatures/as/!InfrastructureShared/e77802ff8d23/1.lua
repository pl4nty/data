-- Threat: !InfrastructureShared
-- Name: e77802ff8d23
-- Type: 21

if mp.get_mpattribute("HSTR:IsVB6") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
