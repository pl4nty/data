-- Threat: !InfrastructureShared
-- Name: 3678358d3457
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
