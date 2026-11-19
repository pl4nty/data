-- Threat: !InfrastructureShared
-- Name: 8f7813ecdbb5
-- Type: 21

if hstrlog[2].matched then
  return mp.INFECTED
end
pe.set_peattribute("hstr_exhaustive", true)
pe.reemulate()
return mp.CLEAN
