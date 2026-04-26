-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32LokiC2Config\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 20 or l_0_0 > 50000 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if (string.sub)(l_0_1, -3) ~= ".js" then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "\\resources\\app\\", 1, true) then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
if not (string.find)(l_0_2, "storageAccount", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_2, "containerName", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_2, "sasToken", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_2, "sleepinterval", 1, true) then
  return mp.CLEAN
end
local l_0_3 = (string.find)(l_0_2, "sleepjitter", 1, true)
set_research_data("loki_config_path", l_0_1, false)
if l_0_3 then
  set_research_data("loki_config_has_jitter", "true", false)
end
return mp.INFECTED

