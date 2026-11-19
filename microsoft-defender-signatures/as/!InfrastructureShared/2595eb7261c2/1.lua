-- Threat: !InfrastructureShared
-- Name: 2595eb7261c2
-- Type: 21

if peattributes.isexe and pe.isdynamic_va(pevars.sigaddr) == false then
  local l_0_0 = pevars.sigaddr + 7
  local l_0_1 = pevars.sigaddr + 26
  local l_0_2 = pe.vm_search(l_0_0, l_0_1, "u\184+", nil, pe.VM_SEARCH_FOP)
  pe.mmap_patch_va(l_0_2, "\144\144")
  pe.mmap_patch_va(l_0_2 + 7, "\144\144")
  return mp.LOWFI
end
return mp.LOWFI
