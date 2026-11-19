-- Threat: !InfrastructureShared
-- Name: c7787165cd32
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
