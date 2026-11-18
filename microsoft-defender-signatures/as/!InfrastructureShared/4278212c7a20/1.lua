-- Threat: !InfrastructureShared
-- Name: 4278212c7a20
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
