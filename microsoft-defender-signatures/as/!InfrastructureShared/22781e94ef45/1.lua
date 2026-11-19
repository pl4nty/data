-- Threat: !InfrastructureShared
-- Name: 22781e94ef45
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
