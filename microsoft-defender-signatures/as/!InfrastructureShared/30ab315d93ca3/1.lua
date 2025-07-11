-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\30ab315d93ca3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if l_0_0 then
    local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
    if l_0_1 and (MpCommon.StringRegExpSearch)("(?i)(shortcutinstartmenu|runprocess|pipe|deletekey.reg|\\logs\\)", l_0_1) then
      return mp.CLEAN
    end
  end
  local l_0_2, l_0_3 = (bm.get_process_relationships)()
  if l_0_2 then
    for l_0_7,l_0_8 in ipairs(l_0_2) do
      if l_0_8.ppid and l_0_8.image_path then
        local l_0_9 = (string.lower)(l_0_8.image_path)
        if (string.find)(l_0_9, "sysaid", 1, true) and (mp.bitand)(l_0_8.reason_ex, 1) == 1 then
          return mp.INFECTED
        end
      end
    end
  end
  do
    return mp.CLEAN
  end
end

