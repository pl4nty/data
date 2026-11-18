-- Threat: !InfrastructureShared
-- Name: 617850a416ac
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
