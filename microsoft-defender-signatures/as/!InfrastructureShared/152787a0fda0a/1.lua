-- Threat: !InfrastructureShared
-- Name: 152787a0fda0a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
