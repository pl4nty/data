-- Threat: !InfrastructureShared
-- Name: 10b782012003a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
