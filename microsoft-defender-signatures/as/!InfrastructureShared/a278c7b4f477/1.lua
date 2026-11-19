-- Threat: !InfrastructureShared
-- Name: a278c7b4f477
-- Type: 21

if peattributes.suspicious_subsystem_version and peattributes.no_exports and peattributes.suspicious_os_version then
  return mp.INFECTED
end
return mp.CLEAN
