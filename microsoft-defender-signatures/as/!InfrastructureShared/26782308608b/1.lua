-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26782308608b\1.luac 

-- params : ...
-- function num : 0
if peattributes.isdll and peattributes.x86_image and hstrlog[1] and (hstrlog[1]).matched and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" then
  (mp.readprotection)(false)
  local l_0_0 = nil
  if (hstrlog[1]).matched then
    l_0_0 = (mp.readfile)((pe.foffset_va)((hstrlog[1]).VA) + 12, 4)
  end
  if l_0_0 ~= nil then
    local l_0_1 = (mp.readu_u32)(l_0_0, 1)
    if l_0_1 ~= nil then
      local l_0_2 = (mp.readfile)((pe.foffset_va)(l_0_1), 80)
      if l_0_2 ~= nil and #l_0_2 == 80 then
        for l_0_6 = 0, 15 do
          local l_0_7 = (mp.readu_u32)(l_0_2, l_0_6 * 4 + 1)
          local l_0_8 = (pe.foffset_va)(l_0_7)
          if l_0_8 ~= nil and l_0_8 ~= 4294967295 then
            local l_0_9 = (mp.readfile)(l_0_8, 20)
            if #l_0_9 == 20 then
              local l_0_10 = tostring(l_0_9)
              if l_0_10 ~= "" and l_0_10:match("^[^%.]+%.[^%.]+$") and not l_0_10:match("%.log$") and not l_0_10:match("%.dll$") and not l_0_10:match("%.exe$") then
                (mp.readprotection)(true)
                return mp.INFECTED
              end
            end
          end
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

