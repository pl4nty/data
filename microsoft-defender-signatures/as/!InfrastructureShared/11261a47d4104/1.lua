-- Threat: !InfrastructureShared
-- Name: 11261a47d4104
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
