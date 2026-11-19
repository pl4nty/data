-- Threat: !InfrastructureShared
-- Name: af78216c220e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
