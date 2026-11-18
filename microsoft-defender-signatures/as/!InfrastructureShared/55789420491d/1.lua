-- Threat: !InfrastructureShared
-- Name: 55789420491d
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
