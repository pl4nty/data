-- Threat: !InfrastructureShared
-- Name: 3678878942bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
