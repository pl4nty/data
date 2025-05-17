-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57d766fcc206\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  local l_0_2 = l_0_0.ppid
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = l_0_1:match("([^\\]+)$")
  local l_0_4 = {}
  l_0_4["ng bailey image collector.exe"] = true
  l_0_4["log-agent.exe"] = true
  l_0_4["ossec-agent.exe"] = true
  l_0_4["epclient.exe"] = true
  l_0_4["addmremquery_x86_64_v2.exe"] = true
  if l_0_4[l_0_3] then
    return mp.CLEAN
  end
  local l_0_5 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if l_0_5 ~= nil then
    l_0_5 = (string.lower)(l_0_5)
    if l_0_5:find("alwaysonvpn", 1, true) then
      return mp.CLEAN
    end
    if l_0_5:find("epws\\client\\", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_6, l_0_7 = GetDetectionThresholdMetReason(l_0_2)
  if l_0_6 and (mp.bitxor)(l_0_7, 32) ~= 0 then
    return mp.LOWFI
  end
end
do
  return mp.LOWFI
end

