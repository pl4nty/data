-- Threat: !InfrastructureShared
-- Name: 2f2b3120fa6c9
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if not l_0_1 then
    return mp.CLEAN
  end
  if l_0_1 and MpCommon.StringRegExpSearch("(?i)(shortcutinstartmenu|runprocess|pipe|deletekey.reg|\\logs\\)", l_0_1) then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_2, l_0_3 = bm.get_process_relationships()
if l_0_2 then
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if l_0_5.ppid and l_0_5.image_path then
      local l_0_6 = string.lower(l_0_5.image_path)
      if string.find(l_0_6, "sysaid", 1, true) and mp.bitand(l_0_5.reason_ex, 1) == 1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
