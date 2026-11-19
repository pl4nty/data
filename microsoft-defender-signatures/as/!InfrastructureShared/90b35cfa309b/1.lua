-- Threat: !InfrastructureShared
-- Name: 90b35cfa309b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%windir%"))
  l_0_0 = l_0_1 .. "\\system32\\" .. l_0_0 .. ".dll"
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
    mp.ReportLowfi(l_0_0, 1552316616)
  end
  return mp.INFECTED
end
return mp.CLEAN
