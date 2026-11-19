-- Threat: !InfrastructureShared
-- Name: bfd79211fd07
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["log-agent.exe"] = true,
    ["unitypackagemanager.exe"] = true,
    ["tmacserverservice.exe"] = true,
    ["ossec-agent.exe"] = true,
    ["epclient.exe"] = true,
    ["addmremquery_x86_64_v2.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
local l_0_4 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_4 ~= nil then
  l_0_4 = string.lower(l_0_4)
  if l_0_4:find("xilinx\\xic", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1082", "system_discovery")
if IsDetectionThresholdMet("CMDHSTR") or mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  return mp.INFECTED
end
return mp.CLEAN
