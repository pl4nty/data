-- Threat: !InfrastructureShared
-- Name: 25b3ff3fa362
-- Type: 21

for l_0_0 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_0].matched and sigattr_tail[l_0_0].attribute == 16393 then
    local l_0_1 = sigattr_tail[l_0_0].utf8p1
    if l_0_1 then
      l_0_1 = string.lower(l_0_1)
      if l_0_1 and (string.find(l_0_1, "useraccountcontrolsettings.exe") or string.find(l_0_1, "taskmgr.exe")) then
        local l_0_2 = sigattr_tail[l_0_0].utf8p2
        if 1 < string.len(l_0_2) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
