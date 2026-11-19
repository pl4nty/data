-- Threat: !InfrastructureShared
-- Name: 2878aed0740d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
