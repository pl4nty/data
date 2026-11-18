-- Threat: !InfrastructureShared
-- Name: 3478fb2b45e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
