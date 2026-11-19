-- Threat: !InfrastructureShared
-- Name: 2db3f07b15cb
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  if (string.find(l_0_0, "\\cmd.exe", 1, true) or string.find(l_0_0, "\\powershell.exe", 1, true) or string.find(l_0_0, "\\cscript.exe", 1, true) or string.find(l_0_0, "\\wscript.exe", 1, true) or string.find(l_0_0, "\\mshta.exe", 1, true)) and MpCommon.GetPersistContextCountNoPath("VolatileEnv_systemroot") > 0 then
    local l_0_1 = MpCommon.GetPersistContextNoPath("VolatileEnv_systemroot")
    if l_0_1 then
      for l_0_2, l_0_3 in ipairs(l_0_1) do
        for l_0_4 = 1, mp.SIGATTR_LOG_SZ do
          if sigattr_head[l_0_4].matched and sigattr_head[l_0_4].attribute == 16404 then
            local l_0_5 = string.lower(sigattr_head[l_0_4].utf8p1)
            if not string.find(l_0_5, "c:\\windows\\system32\\", 1, true) and string.find(l_0_5, l_0_3, 1, true) then
              bm.add_related_string("ModuleLoad", l_0_5, bm.RelatedStringBMReport)
              bm.add_related_file(l_0_5)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
