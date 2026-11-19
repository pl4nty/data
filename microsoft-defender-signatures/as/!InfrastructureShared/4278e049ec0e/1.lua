-- Threat: !InfrastructureShared
-- Name: 4278e049ec0e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
