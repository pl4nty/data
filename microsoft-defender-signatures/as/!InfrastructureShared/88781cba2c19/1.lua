-- Threat: !InfrastructureShared
-- Name: 88781cba2c19
-- Type: 21

if mp.get_mpattribute("SIGATTR:COPY_BELOW_WIN") then
  return mp.INFECTED
end
return mp.CLEAN
