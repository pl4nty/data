-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\90b3facdf2d8\0x000012af_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if (string.find)((string.lower)(l_0_0), "\\program files", 1, true) or (string.find)((string.lower)(l_0_0), "\\windows\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

