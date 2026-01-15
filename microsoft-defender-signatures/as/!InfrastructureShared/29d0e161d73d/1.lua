-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\29d0e161d73d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC3: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC4: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("cache").getfilename)()
-- DECOMPILER ERROR at PC9: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 then
  l_0_1 = (("-wal").lower)(l_0_1)
  if contains(l_0_1, l_0_0) then
    return mp.CLEAN
  end
end
return mp.INFECTED

