-- Threat: !InfrastructureShared
-- Name: f178b2a2be3e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
