-- Threat: !InfrastructureShared
-- Name: 54789d16dfec
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
