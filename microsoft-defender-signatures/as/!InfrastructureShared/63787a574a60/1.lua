-- Threat: !InfrastructureShared
-- Name: 63787a574a60
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
