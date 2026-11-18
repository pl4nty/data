-- Threat: !InfrastructureShared
-- Name: a540a5f470ad
-- Type: 21
-- Flags: 1

if mp.get_detectionstatus() == mp.INFECTED or mp.get_mpattribute("SIGATTR:COPY_BELOW_WIN") then
  return mp.INFECTED
end
return mp.CLEAN
