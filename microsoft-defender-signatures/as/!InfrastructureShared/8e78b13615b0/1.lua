-- Threat: !InfrastructureShared
-- Name: 8e78b13615b0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
