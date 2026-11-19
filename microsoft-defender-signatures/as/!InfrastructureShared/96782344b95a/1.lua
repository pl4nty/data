-- Threat: !InfrastructureShared
-- Name: 96782344b95a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
