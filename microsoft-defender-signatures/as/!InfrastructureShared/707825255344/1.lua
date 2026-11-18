-- Threat: !InfrastructureShared
-- Name: 707825255344
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
