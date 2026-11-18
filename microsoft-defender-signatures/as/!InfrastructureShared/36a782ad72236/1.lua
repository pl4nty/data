-- Threat: !InfrastructureShared
-- Name: 36a782ad72236
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
