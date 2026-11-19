-- Threat: !InfrastructureShared
-- Name: d2783c9fa6e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
