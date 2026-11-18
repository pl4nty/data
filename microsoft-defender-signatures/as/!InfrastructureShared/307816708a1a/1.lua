-- Threat: !InfrastructureShared
-- Name: 307816708a1a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
