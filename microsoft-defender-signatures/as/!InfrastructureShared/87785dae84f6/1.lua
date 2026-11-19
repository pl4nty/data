-- Threat: !InfrastructureShared
-- Name: 87785dae84f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
