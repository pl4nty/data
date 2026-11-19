-- Threat: !InfrastructureShared
-- Name: 3a78cc646b70
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
