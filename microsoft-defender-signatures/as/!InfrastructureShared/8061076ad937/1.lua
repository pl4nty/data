-- Threat: !InfrastructureShared
-- Name: 8061076ad937
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
