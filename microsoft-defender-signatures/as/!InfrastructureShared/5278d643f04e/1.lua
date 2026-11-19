-- Threat: !InfrastructureShared
-- Name: 5278d643f04e
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
