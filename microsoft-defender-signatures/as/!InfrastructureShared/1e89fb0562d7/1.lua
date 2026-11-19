-- Threat: !InfrastructureShared
-- Name: 1e89fb0562d7
-- Type: 21

if not (peattributes.isexe and not peattributes.packed and peattributes.no_exception and peattributes.no_exports and peattributes.no_security) or not peattributes.x86_image then
  return mp.CLEAN
end
local l_0_0 = pevars.sigaddr
local l_0_1 = pe.vm_search(l_0_0, l_0_0 + 256, "`\156", nil, pe.VM_SEARCH_FOP)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = pe.vm_search(l_0_1, l_0_1 + 256, "\185", nil, pe.VM_SEARCH_FOP)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = pe.vm_search(l_0_2, l_0_2 + 256, "\226", nil, pe.VM_SEARCH_FOP)
if l_0_2 == nil then
  return mp.CLEAN
end
mp.set_mpattributeex("Lua:fopex_shellter_trick", l_0_1)
return mp.INFECTED
