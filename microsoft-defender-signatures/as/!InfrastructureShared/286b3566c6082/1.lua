-- Threat: !InfrastructureShared
-- Name: 286b3566c6082
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  local l_0_1 = bm.get_imagepath()
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "\\$windows.~bt\\sources\\") then
    return mp.CLEAN
  end
  local l_0_2 = {
    ["bcdboot.exe"] = true,
    ["bfsvc.exe"] = true,
    ["windows10upgraderapp.exe"] = true,
    ["tiworker.exe"] = true
  }
  local l_0_3 = string.match(l_0_1, "([^\\]+)$")
  if l_0_3 and not l_0_2[l_0_3] then
    local l_0_4
    if this_sigattrlog[2].matched then
      l_0_4 = this_sigattrlog[2].utf8p1
    elseif this_sigattrlog[1].matched then
      l_0_4 = this_sigattrlog[1].utf8p1
    end
    if not l_0_4 then
      return mp.CLEAN
    end
    if l_0_4 and not mp.IsKnownFriendlyFile(l_0_4, false, true) then
      mp.ReportLowfi(l_0_4, 676571687)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
