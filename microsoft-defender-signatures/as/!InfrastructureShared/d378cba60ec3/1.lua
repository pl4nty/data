-- Threat: !InfrastructureShared
-- Name: d378cba60ec3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
