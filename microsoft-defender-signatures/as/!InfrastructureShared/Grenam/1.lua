-- Threat: !InfrastructureShared
-- Name: Grenam
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Name == "Virus:Win32/Grenam.A" or l_0_0.Name == "Virus:Win32/Grenam.B" then
  for l_0_1, l_0_2 in ipairs(l_0_0.Resources) do
    if l_0_2.Schema == "file" and sysio.IsFileExists(l_0_2.Path) then
      local l_0_3, l_0_4 = l_0_2.Path:match("(.+\\)([^\\]+)$")
      local l_0_5
      if l_0_0.Name == "Virus:Win32/Grenam.A" then
        l_0_5 = "g"
      elseif l_0_0.Name == "Virus:Win32/Grenam.B" then
        l_0_5 = "v"
      end
      local l_0_6 = l_0_3 .. l_0_5 .. string.sub(l_0_4, 0, -4) .. "ico"
      if sysio.IsFileExists(l_0_6) then
        sysio.DeleteFile(l_0_6)
      end
    end
  end
end
