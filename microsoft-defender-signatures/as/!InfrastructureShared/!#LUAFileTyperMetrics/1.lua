-- Threat: !InfrastructureShared
-- Name: !#LUA:FileTyperMetrics
-- Type: 12
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan

local l_0_0 = "FileTyperMetrics"
local l_0_1 = "FileExtMetrics"
local l_0_2 = "FileTyperTimer"
local l_0_3 = mp.enum_mpattributesubstring("BM_")
if l_0_3 ~= nil and 0 < #l_0_3 then
  local l_0_4 = AddToAtomicCounter(l_0_2, 1, 27000)
  if l_0_4 == nil or l_0_4 == 0 then
    mp.set_mpattribute("LUA:FileTyperReportMetrics")
  end
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if StringEndsWith(l_0_6, "_FILE") then
      local l_0_7 = GetRollingQueueKeyValue(l_0_0, l_0_6)
      if l_0_7 ~= nil then
        AppendToRollingQueue(l_0_0, l_0_6, l_0_7 + 1, 32400)
      else
        AppendToRollingQueue(l_0_0, l_0_6, 1, 32400)
      end
      if l_0_6 == "BM_UNKNOWN_FILE" then
        local l_0_8 = mp.getfilename(mp.FILEPATH_QUERY_FNAME)
        local l_0_9 = string.match(l_0_8, "%.([^.]+)$")
        l_0_9 = l_0_9 == nil and "<none>" or l_0_9
        local l_0_10 = GetRollingQueueKeyValue(l_0_1, l_0_9)
        if l_0_10 ~= nil then
          AppendToRollingQueue(l_0_1, l_0_9, l_0_10 + 1, 32400)
        else
          AppendToRollingQueue(l_0_1, l_0_9, 1, 32400)
        end
      end
    end
  end
end
return mp.INFECTED
