-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_ASporaB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if ((string.find)(l_0_0, "->(Ole", 1, true) or (string.find)(l_0_0, ".wsf", 1, true) or (string.find)(l_0_0, "_pdf", 1, true)) and headerpage[1] == 60 and headerpage[2] == 106 and headerpage[3] == 111 and headerpage[4] == 98 and headerpage[5] == 62 then
  return mp.INFECTED
end
return mp.CLEAN

