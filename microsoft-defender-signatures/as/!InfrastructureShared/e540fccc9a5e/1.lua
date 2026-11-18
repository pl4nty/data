-- Threat: !InfrastructureShared
-- Name: e540fccc9a5e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
