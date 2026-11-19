-- Threat: !InfrastructureShared
-- Name: 327835fbb412
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
