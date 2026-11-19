-- Threat: !InfrastructureShared
-- Name: ShellterLuaInfra
-- Type: 1

function check_expensive_loop(l_1_0, l_1_1, l_1_2)
  if not (l_1_0 and l_1_1) or not l_1_2 then
    return nil
  end
  local l_1_3 = pe.vm_search(l_1_0, l_1_0 + l_1_1, "\226", nil, pe.VM_SEARCH_FOP)
  if l_1_3 == 4294967295 then
    return nil
  end
  local l_1_4, l_1_5 = mp.bsplit(mp.readu_u16(pe.mmap_va(l_1_3, 2), 1), 8)
  local l_1_6 = l_1_3 - mp.bsplit(mp.bitnot(l_1_5), 8) - 4
  l_1_6 = pe.vm_search(l_1_6, l_1_6 + 5, "\185", nil, pe.VM_SEARCH_FOP)
  if l_1_6 == 4294967295 then
    return nil
  end
  local l_1_7 = pe.mmap_va(l_1_6 + 1, 4)
  l_1_7 = mp.readu_u32(l_1_7, 1)
  if l_1_2 >= l_1_7 then
    return nil
  end
  return l_1_3
end
