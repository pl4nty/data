-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9db3a26b43ba\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if (string.find)((string.lower)(l_0_0), "\\miiserver.exe", -14, true) then
  return mp.CLEAN
end
return mp.INFECTED

