-- Threat: !InfrastructureShared
-- Name: Diplugem
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Name == "BrowserModifier:Win32/Diplugem" then
  for l_0_1, l_0_2 in ipairs(l_0_0.Resources) do
    if l_0_2.Schema == "file" and (string.find(l_0_2.Path, ".dll$") or string.find(l_0_2.Path, ".exe$")) then
      local l_0_3
      local l_0_4 = string.sub(l_0_2.Path, 0, -4)
      if string.find(l_0_4, "%.x64%.$") then
        l_0_4 = string.sub(l_0_4, 0, -5)
        l_0_3 = l_0_4 .. "dll"
      else
        l_0_3 = l_0_4 .. "x64.dll"
      end
      if sysio.IsFileExists(l_0_3) then
        sysio.DeleteFile(l_0_3)
      end
      l_0_3 = l_0_4 .. "dat"
      if sysio.IsFileExists(l_0_3) then
        sysio.DeleteFile(l_0_3)
      end
      l_0_3 = l_0_4 .. "tlb"
      if sysio.IsFileExists(l_0_3) then
        sysio.DeleteFile(l_0_3)
      end
    end
  end
end
