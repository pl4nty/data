-- Threat: !InfrastructureShared
-- Name: b27890ee792e
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
