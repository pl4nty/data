-- Threat: !InfrastructureShared
-- Name: fd780afb7a26
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
