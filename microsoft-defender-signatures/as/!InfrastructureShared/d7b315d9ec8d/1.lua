-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d7b315d9ec8d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeys("GODOT-PCK")
do
  if l_0_0 then
    local l_0_1 = (bm.get_current_process_startup_info)()
    if isnull(l_0_1) then
      return mp.INFECTED
    end
    ;
    (bm.add_related_string)("[i] MALICIOUS COMMANDLINE: ", l_0_1.command_line, bm.RelatedStringBMReport)
    add_parents()
  end
  return mp.INFECTED
end

