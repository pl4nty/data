-- Threat: !InfrastructureShared
-- Name: e978bdbae768
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
