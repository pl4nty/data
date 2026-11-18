-- Threat: !InfrastructureShared
-- Name: 8578b696c816
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
