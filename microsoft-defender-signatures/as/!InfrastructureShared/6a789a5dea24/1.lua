-- Threat: !InfrastructureShared
-- Name: 6a789a5dea24
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
