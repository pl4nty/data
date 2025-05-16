-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bfd79211fd07\0x00000652_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {}
  l_0_3["log-agent.exe"] = true
  l_0_3["unitypackagemanager.exe"] = true
  l_0_3["tmacserverservice.exe"] = true
  l_0_3["ossec-agent.exe"] = true
  l_0_3["epclient.exe"] = true
  l_0_3["addmremquery_x86_64_v2.exe"] = true
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
do
  local l_0_4 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if l_0_4 ~= nil then
    l_0_4 = (string.lower)(l_0_4)
    if l_0_4:find("xilinx\\xic", 1, true) then
      return mp.CLEAN
    end
  end
  TrackPidAndTechnique("CMDHSTR", "T1082", "system_discovery")
  if IsDetectionThresholdMet("CMDHSTR") or (mp.IsHipsRuleEnabled)("c1db55ab-c21a-4637-bb3f-a12568109d35") then
    return mp.INFECTED
  end
  return mp.CLEAN
end

