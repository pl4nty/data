-- Threat: !InfrastructureShared
-- Name: 9278623c2755
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
