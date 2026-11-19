-- Threat: !InfrastructureShared
-- Name: 2b78112cd006
-- Type: 21

if peattributes.suspicious_section_name then
  return mp.INFECTED
end
return mp.CLEAN
