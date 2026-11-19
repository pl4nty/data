-- Threat: !InfrastructureShared
-- Name: a540b4e0bd75
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
