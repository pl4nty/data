-- Threat: !InfrastructureShared
-- Name: 6878e8a21fe3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
