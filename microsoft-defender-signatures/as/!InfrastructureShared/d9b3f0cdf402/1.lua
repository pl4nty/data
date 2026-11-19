-- Threat: !InfrastructureShared
-- Name: d9b3f0cdf402
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.len(l_0_0) < 4096 then
    return mp.CLEAN
  end
  if MpCommon.GetPersistContextCountNoPath("Lua:MalPsSmsScanAmsi") > 0 then
    local l_0_1 = bm.get_current_process_startup_info()
    local l_0_2 = MpCommon.GetPersistContextNoPath("Lua:MalPsSmsScanAmsi")
    if l_0_2 then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        if l_0_4 == l_0_1.ppid then
          return mp.INFECTED
        end
      end
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
