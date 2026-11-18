-- Threat: !InfrastructureShared
-- Name: 5b783bf0d538
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
