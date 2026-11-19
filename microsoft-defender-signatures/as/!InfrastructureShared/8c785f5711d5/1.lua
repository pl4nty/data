-- Threat: !InfrastructureShared
-- Name: 8c785f5711d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
