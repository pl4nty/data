-- Threat: !InfrastructureShared
-- Name: 5a7868515639
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
