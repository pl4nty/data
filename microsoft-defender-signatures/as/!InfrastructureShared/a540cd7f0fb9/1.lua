-- Threat: !InfrastructureShared
-- Name: a540cd7f0fb9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
