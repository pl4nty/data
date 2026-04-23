-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fb34fa9bfcc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  if (string.match)(l_0_0, "^/home/[^/]+/%.config/systemd/user/") or (string.match)(l_0_0, "^/home/[^/]+/%.config/autostart/") or (string.match)(l_0_0, "^/root/%.config/systemd/user/") or (string.match)(l_0_0, "^/root/%.config/autostart/") then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN

