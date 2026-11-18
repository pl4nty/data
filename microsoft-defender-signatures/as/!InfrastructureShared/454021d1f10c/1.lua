-- Threat: !InfrastructureShared
-- Name: 454021d1f10c
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
