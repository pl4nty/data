-- Threat: !InfrastructureShared
-- Name: 17678cc8ee1d7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
