-- Threat: !InfrastructureShared
-- Name: 89780b410dec
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
