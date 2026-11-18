-- Threat: !InfrastructureShared
-- Name: 2397823344cdd
-- Type: 21

local l_0_0 = mp.hstr_full_log()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.matched and string.byte(pe.mmap_va(l_0_2.VA + 4, 1)) == string.byte(pe.mmap_va(l_0_2.VA - 4, 1)) then
    mp.set_mpattribute("HSTR:Trojan:Win32/Medfos_Packer")
    mp.set_mpattribute("do_exhaustivehstr_rescan")
    return mp.INFECTED
  end
end
return mp.CLEAN
