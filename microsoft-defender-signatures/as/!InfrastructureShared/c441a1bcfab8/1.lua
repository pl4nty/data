-- Threat: !InfrastructureShared
-- Name: c441a1bcfab8
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
