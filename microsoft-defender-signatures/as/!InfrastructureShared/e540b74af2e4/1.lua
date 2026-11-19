-- Threat: !InfrastructureShared
-- Name: e540b74af2e4
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
