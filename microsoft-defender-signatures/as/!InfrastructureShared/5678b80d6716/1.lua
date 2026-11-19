-- Threat: !InfrastructureShared
-- Name: 5678b80d6716
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
