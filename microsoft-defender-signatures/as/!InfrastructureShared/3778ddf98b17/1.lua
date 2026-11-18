-- Threat: !InfrastructureShared
-- Name: 3778ddf98b17
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
