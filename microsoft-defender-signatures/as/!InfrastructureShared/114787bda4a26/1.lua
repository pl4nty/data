-- Threat: !InfrastructureShared
-- Name: 114787bda4a26
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
