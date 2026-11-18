-- Threat: !InfrastructureShared
-- Name: b978442b7b53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
