-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5d70ebbb22e\1.luac 

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
local l_0_2, l_0_3 = LLMPromptGrader(l_0_1)
if l_0_2 <= 0 then
  return mp.CLEAN
end
l_0_3.Cmdline = l_0_1
local l_0_4 = (mp.GetParentProcInfo)()
do
  if l_0_4 and l_0_4.ppid then
    local l_0_5 = safeJsonSerialize(l_0_3, 150, nil, true)
    ;
    (MpCommon.BmTriggerSig)(l_0_4.ppid, "LLMPromptGrader", l_0_5)
    return mp.INFECTED
  end
  return mp.CLEAN
end

