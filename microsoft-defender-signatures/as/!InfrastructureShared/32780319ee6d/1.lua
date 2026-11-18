-- Threat: !InfrastructureShared
-- Name: 32780319ee6d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
