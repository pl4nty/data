-- Threat: !InfrastructureShared
-- Name: 1d2b31e526b3d
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2))
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p2))
end
if l_0_0 then
  local l_0_1 = {
    "\\users\\.+",
    "\\windows\\.+",
    "\\device\\.+",
    "\\temp\\.+"
  }
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if string.find(l_0_0, l_0_3) then
      local l_0_4 = bm.get_current_process_startup_info()
      if l_0_4 and next(l_0_4) and l_0_4.command_line then
        bm.add_related_file(l_0_0)
        bm.request_SMS(l_0_4.ppid, "M")
        bm.add_action("SmsAsyncScanEvent", 1)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
