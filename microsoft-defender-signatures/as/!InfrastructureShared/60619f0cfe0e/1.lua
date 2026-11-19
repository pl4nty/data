-- Threat: !InfrastructureShared
-- Name: 60619f0cfe0e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
