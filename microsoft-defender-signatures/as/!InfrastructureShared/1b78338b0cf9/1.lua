-- Threat: !InfrastructureShared
-- Name: 1b78338b0cf9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
