-- Threat: !InfrastructureShared
-- Name: 3f7858a27870
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
