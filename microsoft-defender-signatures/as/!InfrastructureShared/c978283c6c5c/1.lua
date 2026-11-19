-- Threat: !InfrastructureShared
-- Name: c978283c6c5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
