-- Threat: !InfrastructureShared
-- Name: 5b78c9d8f2c9
-- Type: 21

if mp.get_mpattribute("SIGATTR:COPY_BELOW_WIN") then
  return mp.INFECTED
end
return mp.CLEAN
