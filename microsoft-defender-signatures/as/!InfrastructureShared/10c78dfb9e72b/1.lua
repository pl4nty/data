-- Threat: !InfrastructureShared
-- Name: 10c78dfb9e72b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
