-- Threat: !InfrastructureShared
-- Name: 3c78c36ad4e2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
