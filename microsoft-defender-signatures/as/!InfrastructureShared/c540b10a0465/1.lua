-- Threat: !InfrastructureShared
-- Name: c540b10a0465
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
