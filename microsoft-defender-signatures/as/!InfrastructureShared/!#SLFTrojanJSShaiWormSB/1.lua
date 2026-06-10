-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSShaiWormSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.gsub)(l_0_0, "\\", "/")
local l_0_2 = {}
-- DECOMPILER ERROR at PC72: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC73: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC74: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC80: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC81: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC82: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC83: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC84: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC85: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC87: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC88: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC90: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC91: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC92: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC93: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC94: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC95: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC97: Overwrote pending register: R5 in 'AssignReg'

if not (".aws/credentials")(".aws/config", "accesstokens.json") then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = contains
local l_0_5 = l_0_3
do
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC117: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R4 in 'AssignReg'

  if not l_0_4 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC131: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: Overwrote pending register: R6 in 'AssignReg'

  if l_0_5 > 4 then
    return l_0_6
  end
  -- DECOMPILER ERROR at PC142: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R6 in 'AssignReg'

  do return l_0_6 end
  -- WARNING: undefined locals caused missing assignments!
end

