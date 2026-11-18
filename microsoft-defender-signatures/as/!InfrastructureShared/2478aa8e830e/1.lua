-- Threat: !InfrastructureShared
-- Name: 2478aa8e830e
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
