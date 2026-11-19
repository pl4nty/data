-- Threat: !InfrastructureShared
-- Name: 2f978c6035e9f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
