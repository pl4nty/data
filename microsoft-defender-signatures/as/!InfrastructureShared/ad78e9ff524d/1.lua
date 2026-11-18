-- Threat: !InfrastructureShared
-- Name: ad78e9ff524d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
