-- Threat: !InfrastructureShared
-- Name: aa78e3a8bcf7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
