-- Threat: !InfrastructureShared
-- Name: 57d766fcc206
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_0.ppid
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = l_0_1:match("([^\\]+)$")
  local l_0_4 = {
    ["ng bailey image collector.exe"] = true,
    ["log-agent.exe"] = true,
    ["ossec-agent.exe"] = true,
    ["epclient.exe"] = true,
    ["addmremquery_x86_64_v2.exe"] = true
  }
  if l_0_4[l_0_3] then
    return mp.CLEAN
  end
  local l_0_5 = mp.GetProcessCommandLine(l_0_0.ppid)
  if l_0_5 ~= nil then
    l_0_5 = string.lower(l_0_5)
    if l_0_5:find("alwaysonvpn", 1, true) then
      return mp.CLEAN
    end
    if l_0_5:find("epws\\client\\", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_6, l_0_7 = GetDetectionThresholdMetReason(l_0_2)
  if l_0_6 and mp.bitxor(l_0_7, 32) ~= 0 then
    return mp.LOWFI
  end
end
return mp.LOWFI
