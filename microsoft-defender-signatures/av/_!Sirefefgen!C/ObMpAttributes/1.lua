-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!Sirefefgen!C\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if pehdr.SizeOfImage >= 131072 then
  return mp.INFECTED
else
  if pehdr.SizeOfImage >= 57344 then
    (mp.changedetectionname)(805306405)
    return mp.INFECTED
  else
    ;
    (mp.changedetectionname)(805306406)
    return mp.SUSPICIOUS
  end
end
return mp.CLEAN

