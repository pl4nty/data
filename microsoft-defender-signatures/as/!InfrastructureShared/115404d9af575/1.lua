-- Threat: !InfrastructureShared
-- Name: 115404d9af575
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
