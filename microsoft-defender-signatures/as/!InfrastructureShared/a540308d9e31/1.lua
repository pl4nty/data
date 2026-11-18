-- Threat: !InfrastructureShared
-- Name: a540308d9e31
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
