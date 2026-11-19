-- Threat: !InfrastructureShared
-- Name: fa789a336677
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
