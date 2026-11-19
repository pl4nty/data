-- Threat: !InfrastructureShared
-- Name: 5c78f53ee5c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
