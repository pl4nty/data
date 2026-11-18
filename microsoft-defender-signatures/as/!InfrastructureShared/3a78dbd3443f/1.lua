-- Threat: !InfrastructureShared
-- Name: 3a78dbd3443f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
