-- Threat: !InfrastructureShared
-- Name: f178eea835d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
