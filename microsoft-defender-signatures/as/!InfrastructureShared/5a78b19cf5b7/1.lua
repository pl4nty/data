-- Threat: !InfrastructureShared
-- Name: 5a78b19cf5b7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
