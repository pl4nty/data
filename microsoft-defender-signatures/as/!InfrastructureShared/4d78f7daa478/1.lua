-- Threat: !InfrastructureShared
-- Name: 4d78f7daa478
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_timestamp then
  return mp.CLEAN
end
if not peattributes.is_delphi then
  return mp.CLEAN
end
if not peattributes.dirty_wx_branch then
  return mp.CLEAN
end
if not peattributes.executes_from_dynamic_memory then
  return mp.CLEAN
end
return mp.INFECTED
