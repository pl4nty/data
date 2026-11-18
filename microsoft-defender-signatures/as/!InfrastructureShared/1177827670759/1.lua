-- Threat: !InfrastructureShared
-- Name: 1177827670759
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
