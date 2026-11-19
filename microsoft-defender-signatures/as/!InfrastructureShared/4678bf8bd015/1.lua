-- Threat: !InfrastructureShared
-- Name: 4678bf8bd015
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
