-- Threat: !InfrastructureShared
-- Name: 218788b8bcd1b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
