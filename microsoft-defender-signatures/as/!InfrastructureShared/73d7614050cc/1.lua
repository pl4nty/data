-- Threat: !InfrastructureShared
-- Name: 73d7614050cc
-- Type: 21
-- Includes: BMLuaLib

if mp.get_mpattribute("RPF:CmdLineMLv2:100") or mp.get_mpattribute("RPF:CmdLineMLv2:130") or mp.get_mpattribute("RPF:CmdLineMLv2:150") then
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
      local l_0_4 = {
        ["winrshost.exe"] = true
      }
      if l_0_3[l_0_2] or mp.IsKnownFriendlyFile(l_0_1, true, false) ~= true then
        local l_0_5 = mp.GetParentProcInfo(l_0_0.ppid)
        if not isnull(l_0_5) and not isnull(l_0_5.image_path) then
          local l_0_6 = string.lower(l_0_5.image_path)
          local l_0_7 = l_0_6:match("([^\\]+)$")
          if l_0_4[l_0_7] then
            return mp.CLEAN
          else
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
