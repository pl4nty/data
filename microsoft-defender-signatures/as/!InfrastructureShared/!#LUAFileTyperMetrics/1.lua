-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAFileTyperMetrics\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "FileTyperMetrics"
local l_0_1 = "FileExtMetrics"
local l_0_2 = "FileTyperTimer"
local l_0_3 = (mp.enum_mpattributesubstring)("BM_")
if l_0_3 ~= nil and #l_0_3 > 0 then
  local l_0_4 = AddToAtomicCounter(l_0_2, 1, 27000)
  if l_0_4 == nil or l_0_4 == 0 then
    (mp.set_mpattribute)("LUA:FileTyperReportMetrics")
  end
  for l_0_8,l_0_9 in ipairs(l_0_3) do
    if StringEndsWith(l_0_9, "_FILE") then
      local l_0_10 = GetRollingQueueKeyValue(l_0_0, l_0_9)
      if l_0_10 ~= nil then
        AppendToRollingQueue(l_0_0, l_0_9, l_0_10 + 1, 32400)
      else
        AppendToRollingQueue(l_0_0, l_0_9, 1, 32400)
      end
      if l_0_9 == "BM_UNKNOWN_FILE" then
        local l_0_11 = (mp.getfilename)(mp.FILEPATH_QUERY_FNAME)
        if (string.match)(l_0_11, "%.([^.]+)$") ~= nil or not "<none>" then
          do
            local l_0_15 = nil
            if GetRollingQueueKeyValue(l_0_1, (string.match)(l_0_11, "%.([^.]+)$")) ~= nil then
              AppendToRollingQueue(l_0_1, l_0_15, GetRollingQueueKeyValue(l_0_1, (string.match)(l_0_11, "%.([^.]+)$")) + 1, 32400)
            else
              AppendToRollingQueue(l_0_1, l_0_15, 1, 32400)
            end
            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
l_0_4 = mp
l_0_4 = l_0_4.INFECTED
return l_0_4

