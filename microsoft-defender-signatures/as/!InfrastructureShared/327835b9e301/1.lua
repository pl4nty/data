-- Threat: !InfrastructureShared
-- Name: 327835b9e301
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
