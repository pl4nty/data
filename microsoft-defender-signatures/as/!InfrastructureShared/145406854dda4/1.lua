-- Threat: !InfrastructureShared
-- Name: 145406854dda4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
