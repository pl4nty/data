-- Threat: !InfrastructureShared
-- Name: 2c78c762176e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
