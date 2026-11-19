-- Threat: !InfrastructureShared
-- Name: 32896bd03ade
-- Type: 21

local l_0_0 = pevars.sigaddr
local l_0_1 = pe.vm_search(l_0_0, l_0_0 + 144, "\129=\144\001\004\240I\002\000s\144\000", nil, pe.VM_SEARCH_BM)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
pe.mmap_patch_va(l_0_0 + 41, "j\001\144")
pe.mmap_patch_va(l_0_1 + 6, "\001\000\000")
return mp.INFECTED
