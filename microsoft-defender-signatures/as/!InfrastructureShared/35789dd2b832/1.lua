-- Threat: !InfrastructureShared
-- Name: 35789dd2b832
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
