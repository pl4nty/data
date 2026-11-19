-- Threat: !InfrastructureShared
-- Name: 2a788fdf96a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
