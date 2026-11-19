-- Threat: !InfrastructureShared
-- Name: 927882312bd5
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
