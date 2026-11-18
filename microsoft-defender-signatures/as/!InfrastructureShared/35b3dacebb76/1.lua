-- Threat: !InfrastructureShared
-- Name: 35b3dacebb76
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2 = true
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_1) do
  local l_0_6 = mp.bitand(l_0_5.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_6 == bm.RELATIONSHIP_CREATED then
    local l_0_7 = string.lower(l_0_5.image_path)
    if string.find(l_0_7, "\\windows\\sys", 1, true) or string.find(l_0_7, "\\program files", 1, true) or string.find(l_0_7, "\\choco", 1, true) or string.find(l_0_7, "\\wlanscan", 1, true) or string.find(l_0_7, "\\csc.exe", 1, true) or string.find(l_0_7, "\\7z", 1, true) or string.find(l_0_7, "\\bginfo", 1, true) or string.find(l_0_7, "\\cloudbuild\\", 1, true) or string.find(l_0_7, "\\winscp.exe", 1, true) or string.find(l_0_7, "\\dismhost", 1, true) then
      l_0_2 = false
    else
      l_0_2 = true
    end
    if string.find(l_0_7, "regsvr32.exe", 1, true) or string.find(l_0_7, "rundll32.exe", 1, true) or string.find(l_0_7, "\\java", 1, true) then
      l_0_2 = true
    end
    if l_0_2 == true then
      MpCommon.TurnNriOnProcess(l_0_5.ppid)
      bm.trigger_sig("AmsiDownloadExecProc", "Trigger", l_0_5.ppid)
      l_0_3 = true
    end
  end
end
if l_0_3 == true then
  return mp.INFECTED
end
return mp.CLEAN
