-- Threat: !InfrastructureShared
-- Name: 1b978d1e8bdb9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
