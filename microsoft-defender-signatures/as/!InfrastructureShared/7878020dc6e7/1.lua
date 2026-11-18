-- Threat: !InfrastructureShared
-- Name: 7878020dc6e7
-- Type: 21

if peattributes.isdll and (hstrlog[1] or hstrlog[2] or hstrlog[3]) then
  mp.readprotection(false)
  local l_0_0
  local l_0_1 = 0
  if hstrlog[1].matched then
    l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA) + 8, 4)
    l_0_1 = hstrlog[1].VA
  elseif hstrlog[2].matched then
    l_0_0 = mp.readfile(pe.foffset_va(hstrlog[2].VA) + 8, 4)
    l_0_1 = hstrlog[2].VA
  elseif hstrlog[3].matched then
    l_0_0 = mp.readfile(pe.foffset_va(hstrlog[3].VA) + 8, 4)
    l_0_1 = hstrlog[3].VA
  end
  if l_0_0 ~= nil then
    local l_0_2 = mp.readu_u32(l_0_0, 1)
    if l_0_2 ~= nil then
      l_0_0 = l_0_2 + l_0_1 + 5 + 7
      l_0_0 = mp.readfile(pe.foffset_va(l_0_0), 15)
      if l_0_0 ~= nil then
        l_0_2 = mp.readu_u64(l_0_0, 1)
        if l_0_2 ~= nil then
          local l_0_3 = mp.readfile(pe.foffset_va(l_0_2), 20)
          if #l_0_3 == 20 then
            local l_0_4 = tostring(l_0_3)
            local l_0_5 = l_0_4:match("[ -~]+")
            if l_0_5 ~= "" and l_0_5:match("^[%w]+%.[%a][%a][%a]?[%a]?$") and not l_0_5:match("%.log$") and not l_0_5:match("%.dll$") and not l_0_5:match("%.exe$") then
              mp.readprotection(true)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
  mp.readprotection(true)
end
return mp.CLEAN
