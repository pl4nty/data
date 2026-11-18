-- Threat: !InfrastructureShared
-- Name: b67810f8274c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
