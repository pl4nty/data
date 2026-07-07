-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSShaiWormSA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "node.exe" and l_0_0 ~= "bun.exe" then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!.copilot") and not (mp.get_mpattribute)("Lua:LastFolder0!.vscode") and not (mp.get_mpattribute)("Lua:LastFolder0!.gemini") and not (mp.get_mpattribute)("Lua:LastFolder0!.github") and not (mp.get_mpattribute)("Lua:LastFolder0!.claude") and not (mp.get_mpattribute)("Lua:LastFolder0!rules") and not (mp.get_mpattribute)("Lua:LastFolder0!.windsurf") then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC102: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC103: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC104: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC105: Overwrote pending register: R6 in 'AssignReg'

if not (".claude")(".cursor/rules", ".cursor\\rules", true) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC117: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC118: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC119: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC121: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC123: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC124: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC125: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC126: Overwrote pending register: R7 in 'AssignReg'

if not ("setup.mjs")("setup.mdc", "setup.js", true) then
  return mp.CLEAN
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = contains
local l_0_7 = l_0_5
do
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC147: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC153: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC154: Overwrote pending register: R6 in 'AssignReg'

  if not l_0_6 then
    return l_0_6
  end
  -- DECOMPILER ERROR at PC156: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R7 in 'AssignReg'

  if not l_0_6 then
    return l_0_7
  end
  -- DECOMPILER ERROR at PC166: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R8 in 'AssignReg'

  if not l_0_7 then
    return l_0_8
  end
  -- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: Overwrote pending register: R8 in 'AssignReg'

  if l_0_8 or l_0_8 then
    return l_0_8
  end
  -- DECOMPILER ERROR at PC188: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC189: Overwrote pending register: R8 in 'AssignReg'

  do return l_0_8 end
  -- WARNING: undefined locals caused missing assignments!
end

