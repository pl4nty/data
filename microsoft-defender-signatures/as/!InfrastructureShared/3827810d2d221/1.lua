-- Threat: !InfrastructureShared
-- Name: 3827810d2d221
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
