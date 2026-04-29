-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFLuaAIAgentContextFileA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC42: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC43: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R6 in 'AssignReg'

if not (".claude")(".agents", ".copilot", true) then
  return mp.CLEAN
end
local l_0_4 = {}
if not l_0_4[l_0_2] then
  return mp.CLEAN
end
do
  local l_0_5, l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
  do
    local l_0_6, l_0_8 = , (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) or ""
    local l_0_9 = nil
    -- DECOMPILER ERROR at PC119: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC121: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC122: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC123: Overwrote pending register: R10 in 'AssignReg'

    ;
    (".windsurf")(".gemini", (".autogen")({file = l_0_2, path = l_0_1, process = l_0_8, process_path = l_0_9}), false)
    return mp.INFECTED
  end
end

