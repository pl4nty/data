-- Threat: !InfrastructureShared
-- Name: 3778ddc3d4a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
