-- Threat: !InfrastructureShared
-- Name: 5478e6d80095
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
