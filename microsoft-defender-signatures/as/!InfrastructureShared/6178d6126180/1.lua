-- Threat: !InfrastructureShared
-- Name: 6178d6126180
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
