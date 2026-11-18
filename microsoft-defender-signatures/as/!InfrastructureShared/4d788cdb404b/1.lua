-- Threat: !InfrastructureShared
-- Name: 4d788cdb404b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
