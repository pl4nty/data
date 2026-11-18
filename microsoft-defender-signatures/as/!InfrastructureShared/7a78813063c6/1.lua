-- Threat: !InfrastructureShared
-- Name: 7a78813063c6
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
