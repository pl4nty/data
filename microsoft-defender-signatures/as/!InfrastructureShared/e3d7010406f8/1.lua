-- Threat: !InfrastructureShared
-- Name: e3d7010406f8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
local l_0_2 = string.lower(l_0_0.image_path)
if l_0_2:match("([^\\]+)$") ~= "powershell.exe" then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  local l_0_3 = {
    "invoke-webrequest",
    "invoke-expression",
    "| invoke-expression",
    "|iex",
    "| iex",
    "iwr ",
    "downloaddata",
    "net.webclient",
    "iex(["
  }
  if contains(l_0_1, l_0_3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
