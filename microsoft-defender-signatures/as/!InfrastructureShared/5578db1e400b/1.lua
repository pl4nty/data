-- Threat: !InfrastructureShared
-- Name: 5578db1e400b
-- Type: 21

if peattributes.dll == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
