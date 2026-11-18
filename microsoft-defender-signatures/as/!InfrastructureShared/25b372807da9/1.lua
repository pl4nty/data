-- Threat: !InfrastructureShared
-- Name: 25b372807da9
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\chrome\\application\\chrome.exe", 1, true) or string.find(l_0_0, "\\microsoftedge", 1, true) or string.find(l_0_0, "windows\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\sophos\\", 1, true) or string.find(l_0_0, "\\application\\browser.exe", 1, true)) then
  return mp.CLEAN
end
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_1].matched and (sigattr_head[l_0_1].attribute == 16401 or sigattr_head[l_0_1].attribute == 16400 or sigattr_head[l_0_1].attribute == 16404) then
    local l_0_2 = sigattr_head[l_0_1].utf8p1
    if sigattr_head[l_0_1].utf8p1 ~= nil then
      local l_0_3 = {
        ["iexplore.exe"] = true,
        ["chrome.exe"] = true,
        ["firefox.exe"] = true,
        ["teams.exe"] = true,
        ["ccmsetup.exe"] = true,
        ["ccmexec.exe"] = true,
        ["outlook.exe"] = true,
        ["olk.exe"] = true
      }
      local l_0_4 = string.match(string.lower(l_0_2), "\\([^\\]+)$")
      if l_0_3[l_0_4] then
        return mp.CLEAN
      end
    end
  end
end
return mp.INFECTED
