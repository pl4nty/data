-- Threat: !InfrastructureShared
-- Name: aa78039de7eb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
