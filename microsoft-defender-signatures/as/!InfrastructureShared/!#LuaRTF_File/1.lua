-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaRTF_File\1.luac 

-- params : ...
-- function num : 0
if headerpage[1] ~= 123 or headerpage[2] ~= 92 or headerpage[3] ~= 114 or headerpage[4] ~= 116 then
  return mp.CLEAN
end
return mp.INFECTED

