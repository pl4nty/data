-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c9d7e1d6419f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = 0
local l_0_3 = str_count_match
local l_0_4 = l_0_1
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC33: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

  if l_0_2 >= 2 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC41: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

