-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_AObfuseSS1\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  if (string.find)(l_0_0, ".sbs/lander/", 1, true) and (string.find)(l_0_0, "download.php", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

