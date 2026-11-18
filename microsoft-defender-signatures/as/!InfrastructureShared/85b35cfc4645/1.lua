-- Threat: !InfrastructureShared
-- Name: 85b35cfc4645
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5 = string.lower(l_0_4.image_path)
  if l_0_5 ~= nil and (string.find(l_0_5, "\\svchost.exe", 1, true) or string.find(l_0_5, "\\msiexec.exe", 1, true) or string.find(l_0_5, "\\runtimebroker.exe", 1, true) or string.find(l_0_5, "\\maatunnel.exe", 1, true) or string.find(l_0_5, "\\cftpstes.exe", 1, true) or string.find(l_0_5, "\\explorer.exe", 1, true) or string.find(l_0_5, "\\dllhost.exe", 1, true) or string.find(l_0_5, "\\msaccess.exe", 1, true) or string.find(l_0_5, "\\dwdesk.exe", 1, true) or string.find(l_0_5, "\\dsaccessservice.exe", 1, true)) then
    return mp.CLEAN
  end
end
if l_0_0 ~= nil and 3 < string.len(l_0_0) then
  local l_0_6 = bm.get_current_process_startup_info()
  if l_0_6 == nil or l_0_6.command_line == nil or string.find(string.lower(l_0_6.command_line), "natsvc*") then
    return mp.CLEAN
  end
  local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_7 ~= nil then
    for l_0_8, l_0_9 in ipairs(l_0_7) do
      if string.find(l_0_9, "\\maslog_runxx.dl") then
        return mp.CLEAN
      end
      l_0_9 = mp.ContextualExpandEnvironmentVariables(l_0_9)
      bm.add_related_file(l_0_9)
    end
  end
end
return mp.INFECTED
