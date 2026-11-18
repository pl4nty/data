-- Threat: !InfrastructureShared
-- Name: 5a78be90bdcb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
