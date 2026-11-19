-- Threat: !InfrastructureShared
-- Name: 577848914c09
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
