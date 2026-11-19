-- Threat: !InfrastructureShared
-- Name: 1978fdd3a007
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
