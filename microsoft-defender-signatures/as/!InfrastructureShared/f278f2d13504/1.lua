-- Threat: !InfrastructureShared
-- Name: f278f2d13504
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
