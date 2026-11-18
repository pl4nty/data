-- Threat: !InfrastructureShared
-- Name: d5403c3405bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
