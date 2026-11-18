-- Threat: !InfrastructureShared
-- Name: 2278bd826282
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
