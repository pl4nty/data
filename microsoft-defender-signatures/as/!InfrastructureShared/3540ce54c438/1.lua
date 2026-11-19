-- Threat: !InfrastructureShared
-- Name: 3540ce54c438
-- Type: 21

if peattributes.isdamaged then
  pe.set_peattribute("isdamaged", false)
  return mp.INFECTED
end
return mp.CLEAN
