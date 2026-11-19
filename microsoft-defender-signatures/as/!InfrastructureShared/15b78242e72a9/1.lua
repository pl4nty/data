-- Threat: !InfrastructureShared
-- Name: 15b78242e72a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
