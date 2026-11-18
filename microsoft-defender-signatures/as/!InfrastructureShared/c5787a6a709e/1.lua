-- Threat: !InfrastructureShared
-- Name: c5787a6a709e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
