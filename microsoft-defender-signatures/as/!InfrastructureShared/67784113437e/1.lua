-- Threat: !InfrastructureShared
-- Name: 67784113437e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
