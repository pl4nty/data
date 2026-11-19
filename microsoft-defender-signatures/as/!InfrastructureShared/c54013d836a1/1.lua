-- Threat: !InfrastructureShared
-- Name: c54013d836a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
