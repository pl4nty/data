-- Threat: !InfrastructureShared
-- Name: 7540c075ffe4
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
