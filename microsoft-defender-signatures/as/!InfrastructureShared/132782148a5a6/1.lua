-- Threat: !InfrastructureShared
-- Name: 132782148a5a6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
