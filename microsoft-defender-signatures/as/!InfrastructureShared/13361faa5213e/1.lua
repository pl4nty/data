-- Threat: !InfrastructureShared
-- Name: 13361faa5213e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
