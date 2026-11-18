-- Threat: !InfrastructureShared
-- Name: 3678fdec729d
-- Type: 21

local l_0_0 = hstrlog[1].VA + 24
if not pe.isdynamic_va(l_0_0) and peattributes.isexe and pehdr.NumberOfSections < 5 then
  local l_0_1 = pe.foffset_va(l_0_0)
  for l_0_2 = 1, pehdr.NumberOfSections do
    if pe.contains_va(l_0_2, l_0_0) then
      local l_0_3 = l_0_1 - pesecs[l_0_2].PointerToRawData
      if l_0_3 < 512 or 4000000 < l_0_3 then
        return mp.CLEAN
      end
      mp.readprotection(false)
      local l_0_4 = mp.readfile(l_0_1 - l_0_3, l_0_3)
      mp.vfo_add_buffer(string.reverse(l_0_4), "[b64mz_reverse]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      return mp.CLEAN
    end
  end
end
return mp.LOWFI
