-- Threat: !InfrastructureShared
-- Name: 8e8d0f771147
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Optimizer.A")
  return mp.INFECTED
end
return mp.LOWFI
