-- Threat: !InfrastructureShared
-- Name: c9b3094eced0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info().ppid
local l_0_1
if l_0_0 ~= nil then
  l_0_1 = mp.GetProcessCommandLine(l_0_0)
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if l_0_1 == nil and string.len(l_0_1) <= 4 then
    return mp.CLEAN
  end
  local l_0_2 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  bm_AddRelatedFileFromCommandLine(l_0_1, l_0_2)
  if this_sigattrlog[6].matched then
    local l_0_3 = this_sigattrlog[6].utf8p2
    bm_AddRelatedFileFromCommandLine(l_0_3, l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
