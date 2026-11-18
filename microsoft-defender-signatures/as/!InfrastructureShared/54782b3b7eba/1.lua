-- Threat: !InfrastructureShared
-- Name: 54782b3b7eba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
