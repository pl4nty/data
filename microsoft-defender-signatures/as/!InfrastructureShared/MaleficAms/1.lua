-- Threat: !InfrastructureShared
-- Name: MaleficAms
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "Behavior:Win32/MaleficAms.I") then
  for l_0_1, l_0_2 in ipairs(Remediation.Threat.Resources) do
    if l_0_2.Schema == "behavior" then
      local l_0_3 = string.match(l_0_2.Path, "process: (%a:\\[^,]+%.exe)")
      if l_0_3 and sysio.IsFileExists(l_0_3) then
        sysio.DeleteFile(l_0_3)
        break
      end
    end
  end
end
