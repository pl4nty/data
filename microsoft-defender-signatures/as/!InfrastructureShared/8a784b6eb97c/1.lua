-- Threat: !InfrastructureShared
-- Name: 8a784b6eb97c
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_section_name then
  return mp.CLEAN
end
if not peattributes.executes_from_dynamic_memory then
  return mp.CLEAN
end
return mp.INFECTED
