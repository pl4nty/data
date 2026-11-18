-- Threat: !InfrastructureShared
-- Name: 39780c33123d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
