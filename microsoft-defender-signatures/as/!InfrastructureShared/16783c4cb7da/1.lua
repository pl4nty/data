-- Threat: !InfrastructureShared
-- Name: 16783c4cb7da
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if 10 <= l_0_0 then
  return mp.CLEAN
end
return mp.LOWFI
