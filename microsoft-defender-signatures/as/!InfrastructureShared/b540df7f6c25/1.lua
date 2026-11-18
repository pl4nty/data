-- Threat: !InfrastructureShared
-- Name: b540df7f6c25
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
