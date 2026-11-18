-- Threat: !InfrastructureShared
-- Name: 2a785d41a66b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
