-- Threat: !InfrastructureShared
-- Name: c8781f58b08e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
