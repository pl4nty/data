-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin64Timehei\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == 3010425 or l_0_0 == 3070329 or l_0_0 == 3227513 or l_0_0 == 3160953 then
  local l_0_1 = (mp.readheader)(0, 256)
  local l_0_2 = 0
  local l_0_3 = 0
  if (string.find)(l_0_1, "\000\000", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC37: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R6 in 'AssignReg'

  for l_0_8 = (string.byte)(l_0_1, 1, -1), .end do
    local l_0_9 = l_0_4[l_0_8]
    if l_0_9 == 0 then
      l_0_2 = l_0_2 + 1
      if l_0_2 > 4 then
        return mp.CLEAN
      end
    else
      if (l_0_9 >= 32 and l_0_9 <= 127) or l_0_9 >= 9 and l_0_9 <= 13 then
        l_0_3 = l_0_3 + 1
      end
    end
  end
  if l_0_3 > 180 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

