-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_AProslikefangen!inf\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 2700 and (mp.getfilesize)() < 4400 then
  return mp.INFECTED
end
return mp.CLEAN

