-- Threat: !InfrastructureShared
-- Name: 217811f44359
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
