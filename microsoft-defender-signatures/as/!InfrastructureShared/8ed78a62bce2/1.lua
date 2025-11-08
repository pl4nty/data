-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8ed78a62bce2\1.luac 

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
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 and l_0_2.ppid then
  local l_0_3 = add_parents_mp()
  local l_0_4 = {}
  l_0_4.cmdLine = l_0_1
  l_0_4.Parents = l_0_3
  local l_0_5, l_0_6 = safeJsonSerialize(l_0_4, 150, nil, true)
  local l_0_7 = MpCommon.BmTriggerSig
  local l_0_8 = l_0_2.ppid
  local l_0_9 = "Tampering_Setup"
  l_0_7(l_0_8, l_0_9, l_0_5 or l_0_6)
end
do
  do
    set_research_data("Cmdline", (MpCommon.Base64Encode)(l_0_1), false)
    ;
    (mp.set_mpattribute)("HSTR:setup_cmdline_set")
    if (mp.get_mpattribute)("HSTR:setup_type_set") then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC70: freeLocal<0 in 'ReleaseLocals'

  end
end

