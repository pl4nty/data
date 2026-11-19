-- Threat: !InfrastructureShared
-- Name: 2db3d62d16bf
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = l_0_1.command_line
if l_0_2 ~= nil and not string.find(l_0_2, "services.exe", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
  local l_0_3 = MpCommon.GetPersistContextNoPath("ServiceBinHijack")
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if string.lower(l_0_5) == string.lower(l_0_0) then
        bm.add_related_file(l_0_0)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
