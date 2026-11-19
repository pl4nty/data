-- Threat: !InfrastructureShared
-- Name: 70781c27fcca
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
