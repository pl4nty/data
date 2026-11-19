-- Threat: !InfrastructureShared
-- Name: 4378c77ddadf
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
