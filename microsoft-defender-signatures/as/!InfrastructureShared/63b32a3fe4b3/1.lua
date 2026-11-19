-- Threat: !InfrastructureShared
-- Name: 63b32a3fe4b3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  local l_0_2 = l_0_1:match("msdt:[-/]id[%s]+([^%s]+)")
  local l_0_3 = {
    printerdiagnostic = true,
    audioplaybackdiagnostic = true,
    networkdiagnosticsnetworkadapter = true,
    networkdiagnosticsweb = true,
    devicediagnostic = true,
    networkdiagnosticsinbound = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if l_0_1:find("-ep%s+t?s?controlpanel") then
    return mp.CLEAN
  end
  if l_0_1:find("-context", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("systemsetting", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = bm.get_current_process_startup_info()
  if l_0_4.command_line ~= nil then
    local l_0_5 = string.lower(l_0_4.command_line)
    if l_0_5:find("\\systemsettings.exe", 1, true) then
      return mp.CLEAN
    end
  end
  if l_0_2 == "pcwdiagnostic" then
    if l_0_1:find("ms-msdt:[-/]d%s+pcwdiagnostic$") then
      return mp.CLEAN
    end
    TrackPidAndTechniqueBM("BM", "T1218", "msdt_pcwdiag_source")
    local l_0_6 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\sdiagnhost.exe")
    local l_0_7 = sysio.GetProcessFromFileName(l_0_6)
    if l_0_7 ~= nil and 0 < #l_0_7 then
      for l_0_8, l_0_9 in pairs(l_0_7) do
        local l_0_10 = string.format("pid:%d,ProcessStart:%u", l_0_9.pid, l_0_9.starttime)
        TrackPidAndTechniqueBM(l_0_10, "T1218", "msdt_pcwdiag_target")
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
