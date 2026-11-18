-- Threat: !InfrastructureShared
-- Name: 5878b17b5f06
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
