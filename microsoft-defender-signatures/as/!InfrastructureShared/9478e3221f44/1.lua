-- Threat: !InfrastructureShared
-- Name: 9478e3221f44
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
