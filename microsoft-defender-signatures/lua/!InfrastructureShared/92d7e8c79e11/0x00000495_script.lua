-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\92d7e8c79e11\0x00000495_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["qualysagent.exe"] = true
l_0_0["pulsesecureservice.exe"] = true
l_0_0["911 location manager.exe"] = true
l_0_0["logmein.exe"] = true
l_0_0["fasm.exe"] = true
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 ~= nil then
  local l_0_2 = (string.lower)(l_0_1.image_path)
  if l_0_2 ~= nil then
    if l_0_0[l_0_2:match("([^\\]+)$")] or (string.find)(l_0_2, ":\\windows\\assembly\\nativeimages_", 1, true) or (string.find)(l_0_2, ":\\programdata\\ctes\\components\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_2:find("\\relauncher\\.+\\studio%.exe$") or l_0_2:find("\\relauncher\\.+\\launcher%.exe$") then
      return mp.CLEAN
    end
  end
  local l_0_3 = (string.lower)((mp.GetProcessCommandLine)(l_0_1.ppid))
  if l_0_3:find("splunkuniversalforwarder", 1, true) then
    return mp.CLEAN
  end
end
do
  local l_0_4 = (mp.GetParentProcInfo)(l_0_1.ppid)
  do
    if l_0_4 ~= nil then
      local l_0_5 = (string.lower)(l_0_4.image_path)
      if l_0_5 ~= nil and (l_0_0[l_0_5:match("([^\\]+)$")] or (string.find)(l_0_5, ":\\windows\\assembly\\nativeimages_", 1, true) or (string.find)(l_0_5, ":\\programdata\\ctes\\components\\", 1, true)) then
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

