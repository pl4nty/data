-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolLinuxMalPackF\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1
local l_0_1 = 4
if elfhdr.shnum and elfhdr.shnum >= 2 then
  local l_0_2 = esec[elfhdr.shnum - 1]
  local l_0_3 = esec[elfhdr.shnum]
  if l_0_2 and l_0_3 then
    local l_0_4 = (elf.GetSectionName)(l_0_2.name)
    local l_0_5 = (elf.GetSectionName)(l_0_3.name)
    do
      if not (string.match)(l_0_4, "^[^%z]*") then
        local l_0_6, l_0_7, l_0_9, l_0_10, l_0_12 = not l_0_4 or not l_0_5 or l_0_4
      end
      do
        local l_0_8, l_0_11, l_0_13 = , (string.match)(l_0_5, "^[^%z]*") or l_0_5
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC60: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC67: Confused about usage of register: R6 in 'UnsetPending'

        do
          if (string.match)(l_0_8, "^%.[A-Za-z][A-Za-z][A-Za-z]0$") and (string.match)(l_0_11, "^%.[A-Za-z][A-Za-z][A-Za-z]1$") then
            local l_0_14 = nil
            -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

            if (string.sub)(l_0_8, 2, 4) == (string.sub)(l_0_11, 2, 4) and (string.lower)((string.sub)(l_0_8, 2, 4)) ~= "vmp" and l_0_2.type == l_0_0 and l_0_3.type == l_0_0 and (mp.bitand)(l_0_2.flags, l_0_1) ~= 0 and (mp.bitand)(l_0_3.flags, l_0_1) ~= 0 and l_0_3.addr <= elfhdr.entry and elfhdr.entry < l_0_3.addr + l_0_3.size then
              return mp.INFECTED
            end
          end
          return mp.CLEAN
        end
      end
    end
  end
end

