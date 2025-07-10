-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSplunkLogName\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 204800 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)()
if l_0_1 ~= nil and (string.find)(l_0_1, "Splunk9", 1, true) ~= nil and (string.find)(l_0_1, "Install_2025", 1, true) ~= nil then
  (mp.set_mpattribute)("Lua:SplunkInstallLog")
  return mp.INFECTED
end
return mp.CLEAN

