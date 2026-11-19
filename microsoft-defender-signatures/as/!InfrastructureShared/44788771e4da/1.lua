-- Threat: !InfrastructureShared
-- Name: 44788771e4da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
