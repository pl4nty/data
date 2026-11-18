-- Threat: !InfrastructureShared
-- Name: 7c61f1874591
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
