-- Threat: !InfrastructureShared
-- Name: 8378d6286b68
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
