-- Threat: !InfrastructureShared
-- Name: b47802346287
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
