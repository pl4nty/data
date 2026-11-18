-- Threat: !InfrastructureShared
-- Name: c54068e3b514
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
