-- Threat: !InfrastructureShared
-- Name: 347890f4dc60
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
