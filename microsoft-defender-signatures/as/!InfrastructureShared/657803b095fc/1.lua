-- Threat: !InfrastructureShared
-- Name: 657803b095fc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
