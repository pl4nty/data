-- Threat: !InfrastructureShared
-- Name: 1254000ea80de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
