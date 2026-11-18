-- Threat: !InfrastructureShared
-- Name: 2978cc9ab059
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
