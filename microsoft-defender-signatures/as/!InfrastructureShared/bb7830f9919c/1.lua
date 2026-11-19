-- Threat: !InfrastructureShared
-- Name: bb7830f9919c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
