-- Threat: !InfrastructureShared
-- Name: 5b783850b961
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
