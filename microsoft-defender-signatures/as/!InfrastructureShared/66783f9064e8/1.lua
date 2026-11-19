-- Threat: !InfrastructureShared
-- Name: 66783f9064e8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
