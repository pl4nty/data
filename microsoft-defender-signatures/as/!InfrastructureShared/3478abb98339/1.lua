-- Threat: !InfrastructureShared
-- Name: 3478abb98339
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
