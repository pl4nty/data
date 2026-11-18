-- Threat: !InfrastructureShared
-- Name: ae78211e4ae1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
