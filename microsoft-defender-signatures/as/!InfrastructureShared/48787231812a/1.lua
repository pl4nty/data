-- Threat: !InfrastructureShared
-- Name: 48787231812a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
