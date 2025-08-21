-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bd73b3effed\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and l_0_0.ppid then
  local l_0_1 = (mp.GetScannedPPID)()
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
  local l_0_3 = MpCommon.BmTriggerSig
  local l_0_4 = l_0_0.ppid
  local l_0_5 = "LLMPrompt_Malicious_B"
  l_0_3(l_0_4, l_0_5, l_0_2 or "")
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  return l_0_3
end
do
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC36: freeLocal<0 in 'ReleaseLocals'

end

