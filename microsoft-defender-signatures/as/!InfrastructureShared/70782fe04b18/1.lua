-- Threat: !InfrastructureShared
-- Name: 70782fe04b18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
