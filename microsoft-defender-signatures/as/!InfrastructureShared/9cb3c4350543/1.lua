-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3c4350543\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.command_line ~= nil and l_0_0.command_line ~= "" then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
end
return mp.INFECTED

