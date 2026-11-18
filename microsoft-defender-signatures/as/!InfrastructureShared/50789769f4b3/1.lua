-- Threat: !InfrastructureShared
-- Name: 50789769f4b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
