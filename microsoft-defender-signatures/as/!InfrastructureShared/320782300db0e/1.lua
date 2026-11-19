-- Threat: !InfrastructureShared
-- Name: 320782300db0e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
