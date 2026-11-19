-- Threat: !InfrastructureShared
-- Name: 3a78f9f3129a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
