-- Threat: !InfrastructureShared
-- Name: 4778df7bd183
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
