-- Threat: !InfrastructureShared
-- Name: 1c54085f76f85
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
