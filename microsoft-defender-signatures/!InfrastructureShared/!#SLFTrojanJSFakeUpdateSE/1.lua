-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSFakeUpdateSE\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    local l_0_4 = (string.lower)((mp.GetProcessCommandLine)(l_0_3))
    if StringEndsWith(l_0_4, ".js") then
      local l_0_5 = contains
      local l_0_6 = l_0_4
      local l_0_7 = {}
      -- DECOMPILER ERROR at PC42: No list found for R7 , SetList fails

      -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC47: Overwrote pending register: R5 in 'AssignReg'

      if l_0_5 then
        return l_0_5
      end
    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

