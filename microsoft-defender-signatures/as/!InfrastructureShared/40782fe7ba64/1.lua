-- Threat: !InfrastructureShared
-- Name: 40782fe7ba64
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
