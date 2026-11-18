-- Threat: !InfrastructureShared
-- Name: 1b1b3e03b0e16
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
    if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16400 then
      local l_0_2 = string.lower(sigattr_head[l_0_1].utf8p1)
      local l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
      if string.find(l_0_0, l_0_3, 1, true) then
        local l_0_4 = IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_2, true)
        if l_0_4 then
          if string.find(l_0_2, "psexesvc", 1, true) or string.find(l_0_2, "winexesvc", 1, true) or string.find(l_0_2, "framepkg", 1, true) or string.find(l_0_2, "paexec", 1, true) or string.find(l_0_2, "pskllsvc", 1, true) or string.find(l_0_2, "eset-remote", 1, true) or string.find(l_0_2, "mbremoteexec", 1, true) or string.find(l_0_2, "medplsvc", 1, true) or string.find(l_0_2, "remcomsvc", 1, true) or string.find(l_0_2, "remsvc", 1, true) or string.find(l_0_2, "retinalss", 1, true) or string.find(l_0_2, "tenable_mw_scan_", 1, true) or string.find(l_0_2, "pdqinventory", 1, true) or string.find(l_0_2, "pdqdeployrunner", 1, true) or string.find(l_0_2, "\\veeam", 1, true) or string.find(l_0_2, "\\patchagent", 1, true) or string.find(l_0_2, "\\qualys", 1, true) or string.find(l_0_2, "\\sdpod", 1, true) or string.find(l_0_2, "\\bfcrx", 1, true) or string.find(l_0_2, "tniservice", 1, true) then
            return mp.CLEAN
          end
          mp.ReportLowfi(l_0_2, 3414579111)
          bm.add_related_file(l_0_2)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
