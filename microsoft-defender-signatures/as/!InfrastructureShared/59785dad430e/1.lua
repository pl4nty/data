-- Threat: !InfrastructureShared
-- Name: 59785dad430e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
