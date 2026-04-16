-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\92d7e8c79e11\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = getOrgIdScrubbed()
if l_0_0 ~= nil and l_0_0 == "PII_1e9d606afae5d23f70d8c850ce95c82c8bd37f11" then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["qualysagent.exe"] = true
l_0_1["pulsesecureservice.exe"] = true
l_0_1["911 location manager.exe"] = true
l_0_1["logmein.exe"] = true
l_0_1["fasm.exe"] = true
l_0_1["explodeservicehost.exe"] = true
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 ~= nil then
  local l_0_3 = (string.lower)(l_0_2.image_path)
  if l_0_3 ~= nil then
    if l_0_1[l_0_3:match("([^\\]+)$")] or (string.find)(l_0_3, ":\\windows\\assembly\\nativeimages_", 1, true) or (string.find)(l_0_3, ":\\programdata\\ctes\\components\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_3:find("\\relauncher\\.+\\studio%.exe$") or l_0_3:find("\\relauncher\\.+\\launcher%.exe$") then
      return mp.CLEAN
    end
  end
  local l_0_4 = (string.lower)((mp.GetProcessCommandLine)(l_0_2.ppid))
  if l_0_4:find("splunkuniversalforwarder", 1, true) then
    return mp.CLEAN
  end
  if l_0_4:find("\\wdsroot\\exapp\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_4:find("\\programdata\\servicenow\\", 1, true) then
    return mp.CLEAN
  end
end
do
  local l_0_5 = (mp.GetParentProcInfo)(l_0_2.ppid)
  do
    if l_0_5 ~= nil then
      local l_0_6 = (string.lower)(l_0_5.image_path)
      if l_0_6 ~= nil and (l_0_1[l_0_6:match("([^\\]+)$")] or (string.find)(l_0_6, ":\\windows\\assembly\\nativeimages_", 1, true) or (string.find)(l_0_6, ":\\programdata\\ctes\\components\\", 1, true)) then
        return mp.CLEAN
      end
    end
    TrackPidAndTechnique("CMDHSTR", "T1016", "network_discovery")
    if IsDetectionThresholdMet("CMDHSTR") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

