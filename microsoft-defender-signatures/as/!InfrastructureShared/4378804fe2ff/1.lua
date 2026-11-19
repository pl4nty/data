-- Threat: !InfrastructureShared
-- Name: 4378804fe2ff
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
