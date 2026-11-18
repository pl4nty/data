-- Threat: !InfrastructureShared
-- Name: !#LUA:StrangeImportRVA
-- Type: 8

if peattributes.arm_image then
  return mp.CLEAN
end
if peattributes.no_imports and peattributes.no_boundimport and peattributes.no_delayimport and peattributes.no_iat then
  local l_0_0 = pehdr.DataDirectory[2].RVA
  local l_0_1 = pesecs[1].VirtualAddress
  if l_0_0 ~= 0 and l_0_0 < 8192 and l_0_0 < l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
