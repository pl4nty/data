-- Threat: !InfrastructureShared
-- Name: 2d4187eba8c9
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p1
  local l_0_1, l_0_2 = extract_urls(l_0_0)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2[1]
  if isnull(l_0_3) then
    return mp.CLEAN
  end
  local l_0_4 = split(l_0_3, ".")
  if isnull(l_0_4) then
    return mp.CLEAN
  end
  local l_0_5 = "." .. tostring(l_0_4[#l_0_4])
  if isSuspTLD(l_0_5) then
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
    return mp.INFECTED
  end
end
return mp.CLEAN
