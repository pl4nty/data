-- Threat: !InfrastructureShared
-- Name: 6c7f7ce22c30
-- Type: 21

if pe.isdynamic_va(pevars.sigaddr) then
  return mp.INFECTED
end
return mp.CLEAN
