-- Threat: !InfrastructureShared
-- Name: 4978dd705c96
-- Type: 21

if peattributes.isdll and hstrlog[1] and hstrlog[1].matched then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA) + 12, 4)
  if l_0_0 ~= nil then
    local l_0_1 = mp.readu_u32(l_0_0, 1)
    if l_0_1 ~= nil then
      local l_0_2 = mp.readfile(pe.foffset_va(l_0_1), 4)
      if #l_0_2 == 4 then
        mp.readprotection(true)
        return mp.INFECTED
      end
    end
  end
  mp.readprotection(true)
end
return mp.CLEAN
