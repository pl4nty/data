-- Threat: !InfrastructureShared
-- Name: 7678ae495b2f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
