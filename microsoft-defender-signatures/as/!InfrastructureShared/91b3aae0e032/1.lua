-- Threat: !InfrastructureShared
-- Name: 91b3aae0e032
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
