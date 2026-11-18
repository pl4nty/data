-- Threat: !InfrastructureShared
-- Name: f0780f6ddb47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
