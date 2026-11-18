-- Threat: !InfrastructureShared
-- Name: 2c78e99683d2
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_1 ~= nil and l_0_0 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
