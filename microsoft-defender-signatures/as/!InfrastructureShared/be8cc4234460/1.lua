-- Threat: !InfrastructureShared
-- Name: be8cc4234460
-- Type: 21

if mp.get_mpattribute("elfa_isconstructorsuspicious") and mp.get_mpattribute("elfa_isstatic") then
  return mp.INFECTED
end
return mp.CLEAN
