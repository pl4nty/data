-- Threat: !InfrastructureShared
-- Name: c540be105b9e
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
