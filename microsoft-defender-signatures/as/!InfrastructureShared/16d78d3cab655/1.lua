-- Threat: !InfrastructureShared
-- Name: 16d78d3cab655
-- Type: 21

if not peattributes.no_resources then
  if mp.HSTR_WEIGHT > 6 then
    local l_0_0
    mp.readprotection(false)
    local l_0_1 = 4294967295
    if hstrlog[4].matched then
      l_0_1 = pe.foffset_va(hstrlog[4].VA + 14)
    elseif hstrlog[5].matched then
      l_0_1 = pe.foffset_va(hstrlog[5].VA + 15)
    elseif hstrlog[6].matched then
      l_0_1 = pe.foffset_va(hstrlog[6].VA + 14)
    elseif hstrlog[7].matched then
      l_0_1 = pe.foffset_va(hstrlog[7].VA + 15)
    end
    if l_0_1 ~= 4294967295 then
      l_0_0 = mp.readfile(l_0_1, 4)
    end
    if l_0_0 ~= nil then
      local l_0_2 = mp.readu_u32(l_0_0, 1)
      l_0_1 = pe.foffset_va(l_0_2)
      if l_0_1 ~= 4294967295 then
        local l_0_3 = mp.readfile(l_0_1, 4)
        local l_0_4 = mp.readu_u32(l_0_3, 1)
        local l_0_5 = pe.foffset_va(l_0_4)
        if l_0_5 ~= 4294967295 then
          local l_0_6 = string.format("HSTR:Gamarue_RC4_password_at_%08X", l_0_4)
          mp.set_mpattribute(l_0_6)
        end
      end
    end
  end
  mp.set_mpattribute("HSTR:Gamarue_RC4DecryptionLowfi")
end
return mp.CLEAN
