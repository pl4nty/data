-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAFileTyperMetrics\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "FileTyperMetrics"
local l_0_1 = "FileTyperTimer"
local l_0_2 = (mp.enum_mpattributesubstring)("BM_")
if l_0_2 ~= nil and #l_0_2 > 0 then
  local l_0_3 = AddToAtomicCounter(l_0_1, 1, 27000)
  if l_0_3 == nil or l_0_3 == 0 then
    (mp.set_mpattribute)("LUA:FileTyperReportMetrics")
  end
  for l_0_7,l_0_8 in ipairs(l_0_2) do
    if StringEndsWith(l_0_8, "_FILE") then
      local l_0_9 = GetRollingQueueKeyValue(l_0_0, l_0_8)
      if l_0_9 ~= nil then
        AppendToRollingQueue(l_0_0, l_0_8, l_0_9 + 1, 32400)
      else
        AppendToRollingQueue(l_0_0, l_0_8, 1, 32400)
      end
    end
  end
end
do
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  return l_0_3
end

