-- Threat: !InfrastructureShared
-- Name: a1783151ff07
-- Type: 21

if mp.get_mpattribute("SIGATTR:FindBaiuduAV") and mp.get_mpattribute("SIGATTR:FindAvastAV") then
  return mp.INFECTED
end
return mp.LOWFI
