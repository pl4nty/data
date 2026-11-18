-- Threat: !InfrastructureShared
-- Name: 4278828734ce
-- Type: 21

if (hstrlog[1] and hstrlog[1].matched or hstrlog[2] and hstrlog[2].matched) and peattributes.isdll and peattributes.x86_image and pesecs[pehdr.NumberOfSections].Name == ".reloc" then
  mp.readprotection(false)
  local l_0_0
  if hstrlog[1].matched then
    l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA) + 12, 4)
  elseif hstrlog[2].matched then
    l_0_0 = mp.readfile(pe.foffset_va(hstrlog[2].VA) + 12, 4)
  end
  if l_0_0 ~= nil then
    local l_0_1 = mp.readu_u32(l_0_0, 1)
    if l_0_1 ~= nil then
      local l_0_2 = mp.readfile(pe.foffset_va(l_0_1), 80)
      if l_0_2 ~= nil and #l_0_2 == 80 then
        local l_0_3 = "k\000e\000r\000n\000e\000l\003\002\000.\000d\000l\000l\000"
        local l_0_4 = 0
        local l_0_5 = 0
        local l_0_6 = 0
        for l_0_7 = 0, 15 do
          local l_0_8 = mp.readu_u32(l_0_2, l_0_7 * 4 + 1)
          local l_0_9 = pe.foffset_va(l_0_8)
          if l_0_9 ~= nil and l_0_9 ~= 4294967295 then
            local l_0_10 = mp.readfile(l_0_9, 20)
            if #l_0_10 == 20 then
              local l_0_11 = tostring(l_0_10)
              local l_0_12 = l_0_11:match("[ -~]+")
              if l_0_12 ~= "" and l_0_12:match("^[%w]+%.[%a][%a][%a]?[%a]?$") and not l_0_12:match("%.log$") and not l_0_12:match("%.dll$") and not l_0_12:match("%.exe$") then
                mp.readprotection(true)
                return mp.INFECTED
              elseif l_0_12 == "kernel32.dll" or l_0_12 == "k" and l_0_11:sub(1, #l_0_3) == l_0_3 then
                l_0_4 = 1
              elseif l_0_12 == "ExitProcess" then
                l_0_5 = 1
              elseif l_0_11:match("%.\000e\000x\000e\000") then
                l_0_6 = 1
              end
            end
          end
        end
        if l_0_4 == 1 and l_0_5 == 1 and l_0_6 == 1 then
          mp.readprotection(true)
          return mp.INFECTED
        end
      end
    end
  end
  mp.readprotection(true)
end
return mp.CLEAN
