-- Threat: !InfrastructureShared
-- Name: 222788ac6e01a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
