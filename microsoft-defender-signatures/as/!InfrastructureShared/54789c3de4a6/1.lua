-- Threat: !InfrastructureShared
-- Name: 54789c3de4a6
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
