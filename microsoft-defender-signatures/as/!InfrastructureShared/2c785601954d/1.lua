-- Threat: !InfrastructureShared
-- Name: 2c785601954d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
