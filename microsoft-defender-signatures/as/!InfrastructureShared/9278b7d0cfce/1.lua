-- Threat: !InfrastructureShared
-- Name: 9278b7d0cfce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
