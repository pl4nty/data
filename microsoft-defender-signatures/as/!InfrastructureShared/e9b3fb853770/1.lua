-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e9b3fb853770\1.luac 

-- params : ...
-- function num : 0
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if l_0_0 ~= nil and l_0_0.ppid ~= nil then
    local l_0_1 = GetTacticsTableForPid(l_0_0.ppid)
    if l_0_1 ~= nil and type(l_0_1) == "table" and #l_0_1 > 5 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

