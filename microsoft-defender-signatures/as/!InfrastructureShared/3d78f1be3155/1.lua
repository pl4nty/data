-- Threat: !InfrastructureShared
-- Name: 3d78f1be3155
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
