-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32CheeseMapF!dha\1.luac 

-- params : ...
-- function num : 0
if (mp.readu_u16)(headerpage, 1) == 10558 then
  (mp.readprotection)(false)
  if (mp.readfile)(78, 38) == "1\015\b\022R\023\001\028\003\020\018\005G\a\a\023\026\n\021R\022\002E\000\001\006G\027\vG%*!G\030\028\000\003" then
    return mp.INFECTED
  end
end
return mp.CLEAN

