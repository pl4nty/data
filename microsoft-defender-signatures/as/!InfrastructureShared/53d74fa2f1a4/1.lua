-- Threat: !InfrastructureShared
-- Name: 53d74fa2f1a4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "c:\\",
  "d:\\",
  "e:\\",
  "f:\\",
  "g:\\",
  "h:\\",
  "l:\\",
  "http"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  ".docx",
  ".pdf",
  ".txt",
  ".hta",
  ".ps1",
  ".dof",
  "verif",
  "ray",
  "start-process",
  "iex",
  "iwr",
  "net.webclient",
  "downloadstring"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 ~= nil and l_0_4.image_path ~= nil then
  local l_0_5 = string.lower(l_0_4.image_path)
  if l_0_5:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
