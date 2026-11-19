-- Threat: !InfrastructureShared
-- Name: e778ecf2ea8f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
