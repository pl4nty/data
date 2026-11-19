-- Threat: !InfrastructureShared
-- Name: 2d789e459b69
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
