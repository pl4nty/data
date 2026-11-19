-- Threat: !InfrastructureShared
-- Name: 8b7844fd68ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
