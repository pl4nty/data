-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin64Timehei\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == 3010425 or l_0_0 == 3070329 or l_0_0 == 3227513 or l_0_0 == 3160953 then
  return mp.INFECTED
end
return mp.CLEAN

