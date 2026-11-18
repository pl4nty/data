-- Threat: !InfrastructureShared
-- Name: 11540a5f29660
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
