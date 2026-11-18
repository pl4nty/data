-- Threat: !InfrastructureShared
-- Name: 28782254bba8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
