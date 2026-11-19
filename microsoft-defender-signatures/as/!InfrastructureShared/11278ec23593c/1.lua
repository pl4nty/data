-- Threat: !InfrastructureShared
-- Name: 11278ec23593c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
