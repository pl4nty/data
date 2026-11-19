-- Threat: !InfrastructureShared
-- Name: 1e785d93c084
-- Type: 21

if hstrlog[1].matched then
  local l_0_0 = pe.mmap_va(hstrlog[1].VA, 176)
  local l_0_1 = string.find(l_0_0, "%z&%z'%z5")
  if l_0_1 ~= nil then
    local l_0_2 = mp.readu_u16(l_0_0, 7)
    local l_0_3 = string.sub(l_0_0, 9, 9 + l_0_2)
    local l_0_4 = mp.crc32(4294967295, l_0_3, 1, l_0_2)
    mp.set_mpattribute(string.format("HSTR:VB:Susp:F:%x", l_0_4))
    local l_0_5 = string.sub(l_0_0, l_0_1 + 6, l_0_1 + 6 + 16)
    local l_0_6 = mp.readu_u32(l_0_5, 1)
    local l_0_7 = mp.readu_u32(l_0_5, 5)
    local l_0_8 = mp.readu_u32(l_0_5, 9)
    local l_0_9 = mp.readu_u32(l_0_5, 13)
    if 2000 < l_0_6 then
      mp.set_mpattribute("HSTR:VB:Susp:FSx2000")
    end
    if 6000 < l_0_6 then
      mp.set_mpattribute("HSTR:VB:Susp:FSx6000")
    end
    if 2000 < l_0_7 then
      mp.set_mpattribute("HSTR:VB:Susp:FSy2000")
    end
    if 6000 < l_0_7 then
      mp.set_mpattribute("HSTR:VB:Susp:FSy6000")
    end
    if l_0_8 == 0 then
      mp.set_mpattribute("HSTR:VB:Susp:FSw0")
    end
    if 2000 < l_0_8 then
      mp.set_mpattribute("HSTR:VB:Susp:FSw2000")
    end
    if 6000 < l_0_8 then
      mp.set_mpattribute("HSTR:VB:Susp:FSw6000")
    end
    if l_0_9 == 0 then
      mp.set_mpattribute("HSTR:VB:Susp:FSh0")
    end
    if 2000 < l_0_9 then
      mp.set_mpattribute("HSTR:VB:Susp:FSh2000")
    end
    if 6000 < l_0_9 then
      mp.set_mpattribute("HSTR:VB:Susp:FSh6000")
    end
    local l_0_10 = string.find(l_0_0, "\000\004\001", 1, true)
    if l_0_10 ~= nil then
      local l_0_11 = mp.readu_u16(l_0_0, l_0_10 + 3)
      local l_0_12 = string.sub(l_0_0, l_0_10 + 3 + 2, l_0_10 + 3 + 2 + l_0_11)
      local l_0_13 = mp.crc32(4294967295, l_0_12, 1, l_0_11)
      mp.set_mpattribute(string.format("HSTR:VB:Susp:BT:%x", l_0_13))
      local l_0_14 = l_0_10 - string.find(string.reverse(string.sub(l_0_0, 1, l_0_10 - 1)), "%z")
      l_0_12 = string.sub(l_0_0, l_0_14 + 1, l_0_10 - 1)
      l_0_13 = mp.crc32(4294967295, l_0_12, 1, l_0_10 - l_0_14 - 1)
      mp.set_mpattribute(string.format("HSTR:VB:Susp:BN:%x", l_0_13))
      local l_0_15 = string.find(string.sub(l_0_0, l_0_10 + 3), "\000\004", 1, true)
      if l_0_15 ~= nil then
        local l_0_16 = string.sub(string.sub(l_0_0, l_0_10 + 3), l_0_15 + 2, l_0_15 + 2 + 8)
        local l_0_17 = mp.readu_u16(l_0_16, 1)
        local l_0_18 = mp.readu_u16(l_0_16, 3)
        local l_0_19 = mp.readu_u16(l_0_16, 5)
        local l_0_20 = mp.readu_u16(l_0_16, 7)
        if 2000 < l_0_17 then
          mp.set_mpattribute("HSTR:VB:Susp:BSx2000")
        end
        if 6000 < l_0_17 then
          mp.set_mpattribute("HSTR:VB:Susp:BSx6000")
        end
        if 2000 < l_0_18 then
          mp.set_mpattribute("HSTR:VB:Susp:BSy2000")
        end
        if 6000 < l_0_18 then
          mp.set_mpattribute("HSTR:VB:Susp:BSy6000")
        end
        if l_0_19 == 0 then
          mp.set_mpattribute("HSTR:VB:Susp:BSw0")
        end
        if 500 < l_0_19 then
          mp.set_mpattribute("HSTR:VB:Susp:BSw500")
        end
        if 1000 < l_0_19 then
          mp.set_mpattribute("HSTR:VB:Susp:BSw1000")
        end
        if 2000 < l_0_19 then
          mp.set_mpattribute("HSTR:VB:Susp:BSw2000")
        end
        if 6000 < l_0_19 then
          mp.set_mpattribute("HSTR:VB:Susp:BSw6000")
        end
        if l_0_20 == 0 then
          mp.set_mpattribute("HSTR:VB:Susp:BSh0")
        end
        if 500 < l_0_20 then
          mp.set_mpattribute("HSTR:VB:Susp:BSh500")
        end
        if 1000 < l_0_20 then
          mp.set_mpattribute("HSTR:VB:Susp:BSh1000")
        end
        if 2000 < l_0_20 then
          mp.set_mpattribute("HSTR:VB:Susp:BSh2000")
        end
        if 6000 < l_0_20 then
          mp.set_mpattribute("HSTR:VB:Susp:BSh6000")
        end
      end
    end
  end
end
return mp.CLEAN
