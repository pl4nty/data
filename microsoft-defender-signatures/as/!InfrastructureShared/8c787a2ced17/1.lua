-- Threat: !InfrastructureShared
-- Name: 8c787a2ced17
-- Type: 21

local l_0_0
if hstrlog[1].matched then
  l_0_0 = hstrlog[1].VA - 16
else
  l_0_0 = hstrlog[2].VA - 32
end
if not pe.isdynamic_va(l_0_0) and (peattributes.isexe or peattributes.ismsil) and pehdr.NumberOfSections < 5 then
  local l_0_1 = pe.foffset_va(l_0_0)
  for l_0_2 = 1, pehdr.NumberOfSections do
    if pe.contains_va(l_0_2, l_0_0) then
      local l_0_3 = pesecs[l_0_2].SizeOfRawData - (l_0_1 - pesecs[l_0_2].PointerToRawData)
      mp.readprotection(false)
      local l_0_4
      if pe.isencrypted_va(l_0_0) then
        l_0_4 = pe.mmap_va(l_0_0, l_0_3)
      else
        l_0_4 = mp.readfile(l_0_1, l_0_3)
      end
      local l_0_5 = 0
      local l_0_6 = 2048
      for l_0_7 = l_0_6, l_0_6 + 8 do
        if string.byte(l_0_4, l_0_7 + 1) < 42 or string.byte(l_0_4, l_0_7 + 1) > 122 then
          l_0_5 = l_0_5 + 1
        else
          break
        end
      end
      if 0 < l_0_5 then
        mp.vfo_add_buffer(string.sub(l_0_4, 0, l_0_6) .. string.sub(l_0_4, l_0_6 + l_0_5 + 1), "[b64mz]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      else
        mp.vfo_add_buffer(l_0_4, "[b64mz]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      end
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
