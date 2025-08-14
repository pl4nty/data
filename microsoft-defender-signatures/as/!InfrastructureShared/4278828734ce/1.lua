-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4278828734ce\1.luac 

-- params : ...
-- function num : 0
if ((hstrlog[1] and (hstrlog[1]).matched) or not hstrlog[2] or (hstrlog[2]).matched) and peattributes.isdll and peattributes.x86_image and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" then
  (mp.readprotection)(false)
  local l_0_0 = nil
  if (hstrlog[1]).matched then
    l_0_0 = (mp.readfile)((pe.foffset_va)((hstrlog[1]).VA) + 12, 4)
  else
    if (hstrlog[2]).matched then
      l_0_0 = (mp.readfile)((pe.foffset_va)((hstrlog[2]).VA) + 12, 4)
    end
  end
  if l_0_0 ~= nil then
    local l_0_1 = (mp.readu_u32)(l_0_0, 1)
    if l_0_1 ~= nil then
      local l_0_2 = (mp.readfile)((pe.foffset_va)(l_0_1), 80)
      if l_0_2 ~= nil and #l_0_2 == 80 then
        local l_0_3 = "k\000e\000r\000n\000e\000l\003\002\000.\000d\000l\000l\000"
        local l_0_4 = 0
        local l_0_5 = 0
        local l_0_6 = 0
        for l_0_10 = 0, 15 do
          local l_0_11 = (mp.readu_u32)(l_0_2, l_0_10 * 4 + 1)
          local l_0_12 = (pe.foffset_va)(l_0_11)
          if l_0_12 ~= nil and l_0_12 ~= 4294967295 then
            local l_0_13 = (mp.readfile)(l_0_12, 20)
            if #l_0_13 == 20 then
              local l_0_14 = tostring(l_0_13)
              local l_0_15 = l_0_14:match("[ -~]+")
              if l_0_15 ~= "" and l_0_15:match("^[%w]+%.[%a][%a][%a]?[%a]?$") and not l_0_15:match("%.log$") and not l_0_15:match("%.dll$") and not l_0_15:match("%.exe$") then
                (mp.readprotection)(true)
                return mp.INFECTED
              else
                if l_0_15 == "kernel32.dll" or l_0_15 == "k" and l_0_14:sub(1, #l_0_3) == l_0_3 then
                  l_0_4 = 1
                else
                  if l_0_15 == "ExitProcess" then
                    l_0_5 = 1
                  else
                    if l_0_14:match("%.\000e\000x\000e\000") then
                      l_0_6 = 1
                    end
                  end
                end
              end
            end
          end
        end
        if l_0_4 == 1 and l_0_5 == 1 and l_0_6 == 1 then
          (mp.readprotection)(true)
          return mp.INFECTED
        end
      end
    end
  end
  do
    do
      ;
      (mp.readprotection)(true)
      return mp.CLEAN
    end
  end
end

