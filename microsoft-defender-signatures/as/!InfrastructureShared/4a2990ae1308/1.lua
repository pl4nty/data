-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4a2990ae1308\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC13: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC14: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC15: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("Microsoft Edge")("dlp_edge.log") do
  if (string.find)(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED

