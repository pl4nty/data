-- Threat: !InfrastructureShared
-- Name: 897822ddd551
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
