-- Threat: !InfrastructureShared
-- Name: 2978e2e0f123
-- Type: 21

if peattributes.isdamaged == true and mp.get_mpattribute("SLF:Win64/CobPipe.A") then
  return mp.INFECTED
end
return mp.CLEAN
