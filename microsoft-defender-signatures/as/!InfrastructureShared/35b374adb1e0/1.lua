-- Threat: !InfrastructureShared
-- Name: 35b374adb1e0
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -10) == "chrome.exe" or string.sub(l_0_0, -11) == "firefox.exe" or string.sub(l_0_0, -12) == "iexplore.exe" then
    local l_0_1
    for l_0_2 = 1, mp.SIGATTR_LOG_SZ do
      if sigattr_tail[l_0_2].matched and sigattr_tail[l_0_2].attribute == 16393 then
        l_0_1 = sigattr_tail[l_0_2].utf8p2
        if l_0_1 ~= nil then
          local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_1)
          for l_0_4, l_0_5 in ipairs(l_0_3) do
            l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
            if sysio.IsFileExists(l_0_5) then
              bm.add_related_file(l_0_5)
            end
          end
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
