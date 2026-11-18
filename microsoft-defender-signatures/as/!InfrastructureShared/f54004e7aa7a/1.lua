-- Threat: !InfrastructureShared
-- Name: f54004e7aa7a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
