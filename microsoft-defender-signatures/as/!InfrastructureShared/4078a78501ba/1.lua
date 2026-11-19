-- Threat: !InfrastructureShared
-- Name: 4078a78501ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
