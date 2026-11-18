-- Threat: !InfrastructureShared
-- Name: 2b78e36a07a9
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
