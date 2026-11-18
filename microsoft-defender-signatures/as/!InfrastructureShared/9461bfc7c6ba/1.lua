-- Threat: !InfrastructureShared
-- Name: 9461bfc7c6ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
