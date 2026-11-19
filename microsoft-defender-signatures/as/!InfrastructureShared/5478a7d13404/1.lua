-- Threat: !InfrastructureShared
-- Name: 5478a7d13404
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
