-- Threat: !InfrastructureShared
-- Name: 19b381c43ecb
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = "file://" .. this_sigattrlog[1].utf8p1
  local l_0_1 = MpCommon.PathToWin32Path(this_sigattrlog[1].utf8p1)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = "autoruninf://" .. string.sub(l_0_1, 2)
  if 1 < #l_0_0 and string.sub(l_0_0, -1) ~= "\\" then
    l_0_0 = l_0_0 .. "\\"
  end
  if 1 < #l_0_1 and string.sub(l_0_1, -1) ~= "\\" then
    l_0_1 = l_0_1 .. "\\"
  end
  local l_0_2 = l_0_1 .. "autorun.inf"
  local l_0_3 = l_0_0 .. "System Volume Information\\MountMgrRemoteDatabase"
  mp.TriggerScanResource("file", l_0_2)
  mp.TriggerScanResource("file", l_0_3)
end
return mp.INFECTED
