-- Threat: !InfrastructureShared
-- Name: 9278b63dda24
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
