-- Threat: !InfrastructureShared
-- Name: 40786b163d19
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
