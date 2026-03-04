-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d8d7f726dfe8\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2, l_0_3 = nil
if pcall(mp.GetParentProcInfo) and mp.GetParentProcInfo ~= nil then
  l_0_2 = (mp.GetParentProcInfo).ppid
  l_0_3 = (mp.GetParentProcInfo).image_path
end
do
  if l_0_2 ~= nil and l_0_3 ~= nil then
    local l_0_4 = nil
    if (((string.lower)(l_0_3)).find)("\\program files\\wsl\\wsl.exe", 1, true) then
      return mp.CLEAN
    end
    TrackPidAndTechnique(l_0_2, "T1087", "user_discovery")
    if IsDetectionThresholdMet(l_0_2) then
      return mp.INFECTED
    end
  end
  return mp.LOWFI
end

