-- Threat: !InfrastructureShared
-- Name: c54047f4af93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
