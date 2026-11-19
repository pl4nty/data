-- Threat: !InfrastructureShared
-- Name: 1168c0e18ac70
-- Type: 21

if mp.get_mpattribute("elfa_isgocompiled") then
  return mp.INFECTED
end
return mp.CLEAN
