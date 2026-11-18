-- Threat: !InfrastructureShared
-- Name: 2878bfd7c5e1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
