-- Threat: !InfrastructureShared
-- Name: c178c1941f1e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
