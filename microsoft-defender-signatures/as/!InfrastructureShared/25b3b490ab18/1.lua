-- Threat: !InfrastructureShared
-- Name: 25b3b490ab18
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid ~= nil and l_0_0.image_path ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("\\([^\\]+)$")
  local l_0_3 = {
    ["cmd.exe"] = true,
    ["powershell.exe"] = true,
    ["pwsh.exe"] = true,
    ["cscript.exe"] = true,
    ["wscript.exe"] = true,
    ["mshta.exe"] = true,
    ["rundll.exe"] = true,
    ["regsvr32.exe"] = true
  }
  if l_0_3[l_0_2] then
    addRelatedProcess()
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 6)
  end
  AddResearchData(l_0_0.ppid, true)
end
return mp.INFECTED
