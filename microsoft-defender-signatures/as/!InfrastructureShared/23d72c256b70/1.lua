-- Threat: !InfrastructureShared
-- Name: 23d72c256b70
-- Type: 21

local l_0_0 = {
  "%LocalAppData%\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\AC",
  "%LocalAppData%\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\LocalCache",
  "%LocalAppData%\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\Settings",
  "%LocalAppData%\\Microsoft\\Windows\\INetCache",
  "%LocalAppData%\\Packages\\Microsoft.StorePurchaseApp_8wekyb3d8bbwe\\AC",
  "%LocalAppData%\\Packages\\Microsoft.StorePurchaseApp_8wekyb3d8bbwe\\LocalCache",
  "%LocalAppData%\\Packages\\Microsoft.StorePurchaseApp_8wekyb3d8bbwe\\Settings"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3 = sysio.ExpandFilePath(l_0_2, true)
  if l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if l_0_5:sub(5, 5) ~= "%" then
        local l_0_6
        if l_0_5:sub(3, 3) == "?" then
          l_0_6 = string.lower(l_0_5:sub(5))
        else
          l_0_6 = string.lower(l_0_5)
        end
        if l_0_6 and l_0_6:sub(2, 10) ~= ":\\windows" then
          local l_0_7 = sysio.FindFiles(l_0_6, "mpengine.dll", 9)
          if 0 < #l_0_7 then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
