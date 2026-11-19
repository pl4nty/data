-- Threat: !InfrastructureShared
-- Name: 2d78e6eeaa4a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
