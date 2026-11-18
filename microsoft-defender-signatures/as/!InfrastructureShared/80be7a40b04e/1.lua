-- Threat: !InfrastructureShared
-- Name: 80be7a40b04e
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SpyLoan.B")
  return mp.INFECTED
end
return mp.LOWFI
