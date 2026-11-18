-- Threat: !InfrastructureShared
-- Name: 8378899e00a9
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
