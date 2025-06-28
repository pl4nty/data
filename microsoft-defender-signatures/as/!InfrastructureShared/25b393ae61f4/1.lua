-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b393ae61f4\1.luac 

-- params : ...
-- function num : 0
if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 and ((string.find)(l_0_0, "\\ide\\devenv.exe", 1, true) or (string.find)(l_0_0, "\\program files\\microsoft vs code\\", 1, true) or (string.find)(l_0_0, "\\program files\\microsoft visual studio\\", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED

