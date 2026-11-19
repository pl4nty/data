-- Threat: !InfrastructureShared
-- Name: 15403275aee3
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") and mp.get_mpattribute("SIGATTR:OpensBHOKey") then
  return mp.LOWFI
end
return mp.CLEAN
