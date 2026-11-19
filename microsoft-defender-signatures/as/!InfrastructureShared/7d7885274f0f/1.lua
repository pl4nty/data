-- Threat: !InfrastructureShared
-- Name: 7d7885274f0f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
