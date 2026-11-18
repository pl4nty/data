-- Threat: !InfrastructureShared
-- Name: 86781ff9f074
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 458752 then
  return mp.INFECTED
end
return mp.CLEAN
