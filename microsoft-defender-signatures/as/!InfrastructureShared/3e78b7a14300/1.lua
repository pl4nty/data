-- Threat: !InfrastructureShared
-- Name: 3e78b7a14300
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
