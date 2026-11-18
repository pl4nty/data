-- Threat: !InfrastructureShared
-- Name: d5784e8b9749
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
