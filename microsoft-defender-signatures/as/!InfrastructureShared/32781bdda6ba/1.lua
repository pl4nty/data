-- Threat: !InfrastructureShared
-- Name: 32781bdda6ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
