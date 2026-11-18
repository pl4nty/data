-- Threat: !InfrastructureShared
-- Name: 5c6154651fb8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
