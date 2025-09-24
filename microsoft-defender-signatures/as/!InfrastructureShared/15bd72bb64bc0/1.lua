-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15bd72bb64bc0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
if #l_0_1 > 450 then
  return mp.CLEAN
end
local l_0_2 = (string.gsub)(l_0_1, "[\"\'`^()+#&]", "")
local l_0_3 = contains
local l_0_4 = l_0_2
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC46: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

