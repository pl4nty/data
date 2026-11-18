-- Threat: !InfrastructureShared
-- Name: 4378bc84ed5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
