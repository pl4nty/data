-- Threat: !InfrastructureShared
-- Name: 92d7e8c79e11
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = getOrgIdScrubbed()
if l_0_0 ~= nil and l_0_0 == "PII_1e9d606afae5d23f70d8c850ce95c82c8bd37f11" then
  return mp.CLEAN
end
local l_0_1 = {
  ["qualysagent.exe"] = true,
  ["pulsesecureservice.exe"] = true,
  ["911 location manager.exe"] = true,
  ["logmein.exe"] = true,
  ["fasm.exe"] = true,
  ["explodeservicehost.exe"] = true
}
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  if l_0_3 ~= nil then
    local l_0_4 = l_0_3:match("([^\\]+)$")
    if l_0_1[l_0_4] or string.find(l_0_3, ":\\windows\\assembly\\nativeimages_", 1, true) or string.find(l_0_3, ":\\programdata\\ctes\\components\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_3:find("\\relauncher\\.+\\studio%.exe$") or l_0_3:find("\\relauncher\\.+\\launcher%.exe$") then
      return mp.CLEAN
    end
  end
  local l_0_5 = string.lower(mp.GetProcessCommandLine(l_0_2.ppid))
  if l_0_5:find("splunkuniversalforwarder", 1, true) then
    return mp.CLEAN
  end
  if l_0_5:find("\\wdsroot\\exapp\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_5:find("\\programdata\\servicenow\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_5:find("\\programfiles\\servicenow\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_6 = mp.GetParentProcInfo(l_0_2.ppid)
if l_0_6 ~= nil then
  local l_0_7 = string.lower(l_0_6.image_path)
  if l_0_7 ~= nil then
    local l_0_8 = l_0_7:match("([^\\]+)$")
    if l_0_1[l_0_8] or string.find(l_0_7, ":\\windows\\assembly\\nativeimages_", 1, true) or string.find(l_0_7, ":\\programdata\\ctes\\components\\", 1, true) or string.find(l_0_7, ":\\programfiles\\servicenow\\", 1, true) or string.find(l_0_7, ":\\programdata\\servicenow\\", 1, true) then
      return mp.CLEAN
    end
  end
end
TrackPidAndTechnique("CMDHSTR", "T1016", "network_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.CLEAN
