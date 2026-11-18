-- Threat: !InfrastructureShared
-- Name: 54789a060b60
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
