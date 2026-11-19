-- Threat: !InfrastructureShared
-- Name: b17870cc3f6e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
