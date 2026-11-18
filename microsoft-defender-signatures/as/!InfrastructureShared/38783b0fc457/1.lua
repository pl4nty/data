-- Threat: !InfrastructureShared
-- Name: 38783b0fc457
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
