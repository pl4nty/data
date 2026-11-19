-- Threat: !InfrastructureShared
-- Name: ffb3b74c05c3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Classes\\Ms-Settings\\Shell\\Open\\Command")
if l_0_1 then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = sysio.RegOpenKey(l_0_3)
    if l_0_4 then
      local l_0_5 = sysio.GetRegValueType(l_0_4, "DelegateExecute")
      if l_0_5 then
        local l_0_6 = sysio.GetRegValueAsString(l_0_4, "")
        if l_0_6 and string.len(l_0_6) > 4 then
          TrackPidAndTechniqueBM(l_0_0.ppid, "T1548.002", "uac_bypass_src")
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
