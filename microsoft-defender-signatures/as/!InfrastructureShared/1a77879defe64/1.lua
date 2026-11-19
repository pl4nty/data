-- Threat: !InfrastructureShared
-- Name: 1a77879defe64
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.is_delphi then
  return mp.CLEAN
end
return mp.INFECTED
