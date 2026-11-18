-- Threat: !InfrastructureShared
-- Name: 4e7897c7a08e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
