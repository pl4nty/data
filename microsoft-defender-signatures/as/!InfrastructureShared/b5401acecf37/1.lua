-- Threat: !InfrastructureShared
-- Name: b5401acecf37
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
