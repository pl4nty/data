-- Threat: !InfrastructureShared
-- Name: 76786b2035d9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
