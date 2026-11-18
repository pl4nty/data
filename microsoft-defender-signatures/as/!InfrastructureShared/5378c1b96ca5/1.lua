-- Threat: !InfrastructureShared
-- Name: 5378c1b96ca5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
