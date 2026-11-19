-- Threat: !InfrastructureShared
-- Name: 30785a67a1b5
-- Type: 21

if mp.get_mpattribute("SIGATTR:COPY_BELOW_WIN") then
  return mp.INFECTED
end
return mp.CLEAN
