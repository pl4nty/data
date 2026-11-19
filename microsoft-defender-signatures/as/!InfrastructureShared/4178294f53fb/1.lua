-- Threat: !InfrastructureShared
-- Name: 4178294f53fb
-- Type: 21

if mp.get_mpattribute("SIGATTR:ASEP") then
  return mp.INFECTED
end
return mp.CLEAN
