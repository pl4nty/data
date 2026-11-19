-- Threat: !InfrastructureShared
-- Name: 8dd72a1efac9
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  if IsPidExcluded(l_0_0.ppid) then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["net.exe"] = true,
    ["wazuh-agent.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if l_0_2 == "powershell.exe" then
    local l_0_4 = mp.GetProcessCommandLine(l_0_0.ppid)
    if l_0_4 ~= nil then
      l_0_4 = string.lower(l_0_4)
      if l_0_4:find("\\microsoft\\windows defender advanced threat protection\\datacollection\\", 1, true) then
        return mp.CLEAN
      end
      if l_0_4:find("windows\\imecache\\healthscripts", 1, true) then
        return mp.CLEAN
      end
      if l_0_4:find("\\\\ossec-agent\\\\", 1, true) then
        return mp.CLEAN
      end
      if l_0_4:find("get-gytlocaluserpasschng", 1, true) and l_0_4:find("convertto-gytjson", 1, true) and l_0_4:find("join-path -path (get-location) -childpath temp", 1, true) then
        return mp.CLEAN
      end
    end
  end
end
TrackPidAndTechnique("CMDHSTR", "T1033", "user_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
