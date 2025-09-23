-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3e4ffc5d8\1.luac 

-- params : ...
-- function num : 0
local l_0_3 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil, (bm.get_current_process_startup_info)()
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_2 = (string.match)(l_0_1.command_line, "^%S+%s+(%S+)$")
  if l_0_3 ~= nil and l_0_3 ~= "" and l_0_2 ~= nil and l_0_2 ~= "" and StringEndsWith(l_0_3, ".lockbit") then
    local l_0_4 = nil
    local l_0_5 = "^(.+)%.[^.]*$"
    do
      if not (string.match)(l_0_3, l_0_5) then
        local l_0_6, l_0_8 = , (string.match)(l_0_3, "^(.+)%.*$")
      end
      -- DECOMPILER ERROR at PC60: Confused about usage of register: R4 in 'UnsetPending'

      do
        do
          if not (string.match)(l_0_2, l_0_5) then
            local l_0_7, l_0_9 = nil
          end
          -- DECOMPILER ERROR at PC62: Confused about usage of register: R5 in 'UnsetPending'

          if l_0_9 == (string.match)(l_0_2, l_0_6) or StringStartsWith(l_0_3, l_0_2) then
            addRelatedProcess()
            reportRelatedBmHits()
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

