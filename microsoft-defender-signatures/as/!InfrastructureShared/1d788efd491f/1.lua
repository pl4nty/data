-- Threat: !InfrastructureShared
-- Name: 1d788efd491f
-- Type: 21

if peattributes.isdll and hstrlog[1] and hstrlog[1].matched then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA) - 4, 4)
  if l_0_0 ~= nil then
    local l_0_1 = mp.readu_u32(l_0_0, 1)
    if l_0_1 ~= nil then
      l_0_0 = mp.readfile(pe.foffset_va(l_0_1), 4)
      if l_0_0 ~= nil then
        l_0_1 = mp.readu_u32(l_0_0, 1)
        if l_0_1 ~= nil then
          local l_0_2 = mp.readfile(pe.foffset_va(l_0_1), 20)
          if #l_0_2 == 20 then
            local l_0_3 = tostring(l_0_2)
            local l_0_4 = l_0_3:match("[ -~]+")
            if l_0_4 ~= "" and l_0_4:match("^[%w]+%.[%a][%a][%a]?[%a]?$") and not l_0_4:match("%.log$") and not l_0_4:match("%.dll$") and not l_0_4:match("%.exe$") then
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
