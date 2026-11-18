-- Threat: !InfrastructureShared
-- Name: f9d74bd8f863
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("Lua:MpRequestEmsScan") > 0 then
  local l_0_0 = MpCommon.GetPersistContextNoPath("Lua:MpRequestEmsScan")
  if l_0_0 then
    local l_0_1 = mp.GetScannedPPID()
    if l_0_1 == nil then
      return mp.CLEAN
    end
    local l_0_2 = MpCommon.GetImagePathFromPid(l_0_1)
    if l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = MpCommon.PathToWin32Path(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = string.lower(mp.GetProcessCommandLine(l_0_1))
    if l_0_4 == nil then
      return mp.CLEAN
    end
    if string.find(l_0_4, "beammp-launcher", 1, true) or string.find(l_0_4, "nginx", 1, true) then
      return mp.CLEAN
    end
    for l_0_5, l_0_6 in ipairs(l_0_0) do
      local l_0_7, l_0_8 = string.match(l_0_6, "^(%d%d%d+)_(.+)$")
      if l_0_7 ~= nil and l_0_8 ~= nil and string.len(l_0_8) > 7 and string.find(string.lower(l_0_8), string.lower(l_0_3), 1, true) then
        local l_0_9, l_0_10 = string.match(l_0_1, "^pid:(%w+),ProcessStart:(%w+)$")
        local l_0_11 = tonumber(l_0_9)
        local l_0_12 = tonumber(l_0_10)
        local l_0_13, l_0_14 = mp.bsplit(l_0_12, 32)
        local l_0_15 = string.format("ppids:{{%d,%d,%d}}\000", l_0_11, l_0_13, l_0_14)
        mp.TriggerScanResource("ems", l_0_15, mp.SCANSOURCE_RTSIG, l_0_7)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
