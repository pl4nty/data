-- Threat: !InfrastructureShared
-- Name: 2078af81ae2d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
