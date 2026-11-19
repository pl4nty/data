-- Threat: !InfrastructureShared
-- Name: 35786e685f3e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
