-- Threat: !InfrastructureShared
-- Name: e540e075458e
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
