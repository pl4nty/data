-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\159d7f0706e6a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 < 200 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
local l_0_3 = {}
-- DECOMPILER ERROR at PC28: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R5 in 'AssignReg'

if l_0_2 and "winlogon.exe" and Contains_any_caseinsenstive("explorer.exe", l_0_3) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = LLMPromptGrader(l_0_1)
if l_0_4 <= 0 then
  return mp.CLEAN
end
if l_0_4 < 5 and #l_0_1 < 500 then
  return mp.CLEAN
end
l_0_5.Cmdline = l_0_1
l_0_5.Parents = add_parents_mp()
do
  if l_0_2 and l_0_2.ppid then
    local l_0_6 = safeJsonSerialize(l_0_5, 150, nil, true)
    ;
    (MpCommon.BmTriggerSig)(l_0_2.ppid, "LLMPromptGrader", l_0_6)
    return mp.INFECTED
  end
  return mp.CLEAN
end

