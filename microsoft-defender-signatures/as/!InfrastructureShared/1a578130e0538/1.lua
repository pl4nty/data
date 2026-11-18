-- Threat: !InfrastructureShared
-- Name: 1a578130e0538
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
