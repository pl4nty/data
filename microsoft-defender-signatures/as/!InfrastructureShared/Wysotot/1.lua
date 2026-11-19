-- Threat: !InfrastructureShared
-- Name: Wysotot
-- Type: 17

local l_0_0 = {
  {
    root = "%APPDATA%",
    all_users = true,
    suffixes = {
      "\\Microsoft\\Internet Explorer\\Quick Launch",
      "\\Microsoft\\Windows\\Start Menu\\Programs"
    }
  },
  {
    root = "%USERPROFILE%",
    all_users = true,
    suffixes = {
      "\\Desktop",
      "\\Start Menu\\Programs"
    }
  },
  {
    root = "%ALLUSERSPROFILE%",
    all_users = false,
    suffixes = {
      "\\Desktop",
      "\\Start Menu\\Programs"
    }
  },
  {
    root = "%ProgramData%",
    all_users = false,
    suffixes = {
      "\\Microsoft\\Windows\\Start Menu\\Programs"
    }
  }
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3 = sysio.ExpandFilePath(l_0_2.root, l_0_2.all_users)
  if l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      for l_0_6, l_0_7 in ipairs(l_0_2.suffixes) do
        local l_0_8 = sysio.FindFiles(l_0_5 .. l_0_7, "*.lnk", -1)
        if l_0_8 then
          for l_0_9, l_0_10 in ipairs(l_0_8) do
            MpDetection.ScanResource("file://" .. l_0_10)
          end
        end
      end
    end
  end
end
