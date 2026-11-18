-- Threat: !InfrastructureShared
-- Name: c57803843878
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
