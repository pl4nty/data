-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptAmsiSuspClickfixB\0x00001a20_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.gsub)(l_0_1, "\"", "")
l_0_1 = (string.gsub)(l_0_1, "\'", "")
local l_0_2 = 0
local l_0_3 = str_count_match
local l_0_4 = l_0_1
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC53: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

  if l_0_2 < 2 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

  if l_0_3 == nil then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC80: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

  if l_0_4 and l_0_4 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC93: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R4 in 'AssignReg'

  do return l_0_4 end
  -- WARNING: undefined locals caused missing assignments!
end

