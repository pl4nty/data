-- Threat: !InfrastructureShared
-- Name: c54067a2c93d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
