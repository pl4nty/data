-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b3a4c49cd4\1.luac 

-- params : ...
-- function num : 0
if this_sigattrlog[2] and (this_sigattrlog[2]).matched then
  local l_0_0 = this_sigattrlog[2]
  local l_0_1 = l_0_0.utf8p1
  if not l_0_1 or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("[%a]:\\[^\"%>%s]*%.dll")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = l_1_0:gsub("\\", "\\\\")
  l_1_1 = l_1_1:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  return l_1_1
end

  local l_0_4 = l_0_3(l_0_2)
  local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_4)
  if not l_0_5 or not l_0_6 then
    return mp.CLEAN
  end
  if l_0_6.value ~= nil then
    local l_0_7 = {}
    -- DECOMPILER ERROR at PC49: No list found for R7 , SetList fails

  end
  do
    do
      if not l_0_7 then
        local l_0_8, l_0_9 = l_0_6
      end
      for l_0_13,l_0_14 in ipairs(l_0_7) do
        do
          do
            local l_0_15, l_0_16 = l_0_14 and l_0_14.value or nil
            -- DECOMPILER ERROR at PC63: Confused about usage of register: R13 in 'UnsetPending'

            -- DECOMPILER ERROR at PC66: Confused about usage of register: R13 in 'UnsetPending'

            -- DECOMPILER ERROR at PC70: Confused about usage of register: R13 in 'UnsetPending'

            if l_0_15 and type(l_0_15) == "string" and l_0_15:find("UnsignedFile", 1, true) then
              return mp.INFECTED
            end
            -- DECOMPILER ERROR at PC80: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
      do return mp.CLEAN end
      l_0_0 = mp
      l_0_0 = l_0_0.CLEAN
      return l_0_0
    end
  end
end

