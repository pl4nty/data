-- Threat: !InfrastructureShared
-- Name: c57806d0e79a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
