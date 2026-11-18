-- Threat: !InfrastructureShared
-- Name: 7d78412cee1e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
