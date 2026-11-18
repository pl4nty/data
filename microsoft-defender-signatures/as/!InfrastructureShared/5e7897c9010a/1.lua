-- Threat: !InfrastructureShared
-- Name: 5e7897c9010a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
