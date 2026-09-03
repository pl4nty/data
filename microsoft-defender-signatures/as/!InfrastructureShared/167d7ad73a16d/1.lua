-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\167d7ad73a16d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 < 20 or #l_0_1 > 4000 then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2 = (string.gsub)(l_0_1, "%^", "")
local l_0_3 = contains
local l_0_4 = l_0_2
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC39: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

  if l_0_3 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  do return l_0_4 end
  -- WARNING: undefined locals caused missing assignments!
end

