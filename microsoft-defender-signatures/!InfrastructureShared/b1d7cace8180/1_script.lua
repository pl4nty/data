-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b1d7cace8180\1_luac 

-- params : ...
-- function num : 0
if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.ppid
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
  if l_0_2 ~= nil then
    l_0_2 = (string.lower)(l_0_2)
    if l_0_2:find("rapid7_endpoint_broker.exe", 1, true) then
      return mp.CLEAN
    end
    if l_0_2:find("rapid7\\insight", 1, true) then
      return mp.CLEAN
    end
  end
end
do
  TrackPidAndTechnique("CMDHSTR", "T1087", "user_discovery")
  if IsDetectionThresholdMet("CMDHSTR") then
    return mp.INFECTED
  end
  return mp.LOWFI
end

