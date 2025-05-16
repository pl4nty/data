-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5541f3e36\0x00007029_luac 

-- params : ...
-- function num : 0
if ((pe.get_versioninfo)()).ProductName == "ePass2001" then
  return mp.CLEAN
end
return mp.INFECTED

