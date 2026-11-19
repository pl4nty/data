-- Threat: !InfrastructureShared
-- Name: 3c784f5b749f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
