-- Threat: !InfrastructureShared
-- Name: 9d78cd628454
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
