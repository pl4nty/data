-- Threat: !InfrastructureShared
-- Name: 91780043615c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
