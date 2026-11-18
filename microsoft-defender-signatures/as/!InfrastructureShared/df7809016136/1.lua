-- Threat: !InfrastructureShared
-- Name: df7809016136
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
