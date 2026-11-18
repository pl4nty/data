-- Threat: !InfrastructureShared
-- Name: 1c613e9d0375
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
