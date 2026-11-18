-- Threat: !InfrastructureShared
-- Name: 6878e1c9e2a6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
