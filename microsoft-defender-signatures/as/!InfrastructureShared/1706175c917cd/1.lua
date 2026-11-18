-- Threat: !InfrastructureShared
-- Name: 1706175c917cd
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
