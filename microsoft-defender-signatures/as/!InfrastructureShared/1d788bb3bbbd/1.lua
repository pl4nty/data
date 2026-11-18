-- Threat: !InfrastructureShared
-- Name: 1d788bb3bbbd
-- Type: 21

if hstrlog[1].matched then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, mp.getfilesize())
  local l_0_1 = pe.foffset_va(hstrlog[1].VA)
  mp.writeu_u32(l_0_0, l_0_1 + 1, hstrlog[1].VA + 4)
  mp.vfo_add_buffer(l_0_0, "locale_patched", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.INFECTED
