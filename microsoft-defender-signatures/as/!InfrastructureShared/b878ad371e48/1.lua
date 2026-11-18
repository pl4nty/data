-- Threat: !InfrastructureShared
-- Name: b878ad371e48
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
