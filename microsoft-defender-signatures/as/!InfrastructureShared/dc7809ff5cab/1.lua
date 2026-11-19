-- Threat: !InfrastructureShared
-- Name: dc7809ff5cab
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
