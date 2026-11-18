-- Threat: !InfrastructureShared
-- Name: e5400be687bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
