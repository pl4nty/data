-- Threat: !InfrastructureShared
-- Name: c540b056bc3a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
