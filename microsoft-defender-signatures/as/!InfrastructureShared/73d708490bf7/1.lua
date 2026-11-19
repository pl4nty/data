-- Threat: !InfrastructureShared
-- Name: 73d708490bf7
-- Type: 21

if mp.get_mpattribute("RPF:CmdLineMLv2:200") or mp.get_mpattribute("RPF:CmdLineMLv2:250") or mp.get_mpattribute("RPF:CmdLineMLv2:300") or mp.get_mpattribute("RPF:CmdLineMLv2:400") then
  local l_0_0 = mp.GetParentProcInfo()
  if l_0_0 ~= nil then
    local l_0_1 = string.lower(l_0_0.image_path)
    if l_0_1 ~= nil then
      local l_0_2 = l_0_1:match("([^\\]+)$")
      local l_0_3 = {
        ["mshta.exe"] = true,
        ["cmd.exe"] = true,
        ["wscript.exe"] = true,
        ["powershell.exe"] = true,
        ["explorer.exe"] = true,
        ["conhost.exe"] = true,
        ["pwsh.exe"] = true
      }
      if l_0_3[l_0_2] or mp.IsKnownFriendlyFile(l_0_1, true, false) ~= true then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
