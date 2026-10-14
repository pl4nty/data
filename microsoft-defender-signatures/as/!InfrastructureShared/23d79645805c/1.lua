-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\23d79645805c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and (string.find)(l_0_0.image_path, "/java", -5, true) and IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN

