-- Threat: !InfrastructureShared
-- Name: 75b3085d85cf
-- Type: 21

local l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_1].matched and sigattr_tail[l_0_1].attribute == 16393 then
    l_0_0 = sigattr_tail[l_0_1].utf8p2
    if l_0_0 ~= nil then
      local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
        if sysio.IsFileExists(l_0_4) then
          bm.add_related_file(l_0_4)
        end
      end
    end
  end
end
return mp.INFECTED
