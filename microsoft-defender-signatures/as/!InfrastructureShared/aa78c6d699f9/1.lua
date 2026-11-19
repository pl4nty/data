-- Threat: !InfrastructureShared
-- Name: aa78c6d699f9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
