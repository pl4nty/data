-- Threat: !InfrastructureShared
-- Name: 4978e83fa27e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
