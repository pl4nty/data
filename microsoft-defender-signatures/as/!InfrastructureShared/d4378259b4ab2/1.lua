-- Threat: !InfrastructureShared
-- Name: d4378259b4ab2
-- Type: 21

if peattributes.isvbnative == true and peattributes.isexe == true then
  return mp.INFECTED
elseif mp.get_mpattribute("HSTR:IsVB6") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
