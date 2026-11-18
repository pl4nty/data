-- Threat: !InfrastructureShared
-- Name: 3c78924e11d5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
