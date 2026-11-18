-- Threat: !InfrastructureShared
-- Name: aa78d2a8dd85
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
