-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 == 0 or l_0_0 > 512 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 10 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
if #l_0_1 > 512 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = {}
-- DECOMPILER ERROR at PC75: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC76: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R6 in 'AssignReg'

if not ("powershell")("pwsh", "cmd.exe") then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC88: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC136: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC137: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC138: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC141: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC142: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC150: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC151: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R7 in 'AssignReg'

  if not ("iex")("invoke-expression", "cmd /c") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC162: Overwrote pending register: R8 in 'AssignReg'

  set_research_data("ClickFixRDia_SA", tostring("cmd /k"), false)
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

