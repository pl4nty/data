-- Threat: !InfrastructureShared
-- Name: 2b892701cb53
-- Type: 21

if pe.get_regval(pe.REG_EBX) < 16777216 then
  return mp.CLEAN
end
return mp.INFECTED
