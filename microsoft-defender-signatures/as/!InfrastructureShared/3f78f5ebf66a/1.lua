-- Threat: !InfrastructureShared
-- Name: 3f78f5ebf66a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
