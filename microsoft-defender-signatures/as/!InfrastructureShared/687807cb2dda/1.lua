-- Threat: !InfrastructureShared
-- Name: 687807cb2dda
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
