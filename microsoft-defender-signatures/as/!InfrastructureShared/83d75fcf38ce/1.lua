-- Threat: !InfrastructureShared
-- Name: 83d75fcf38ce
-- Type: 21
-- Includes: BMLuaLib

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {"powershell"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "irm",
  "invoke-restmethod",
  "iwm",
  "invoke-wmimethod",
  "iex",
  "invoke-expression",
  "invoke-webrequest",
  "iwr"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "captcha",
  "robot",
  "malware",
  "b64 decode:",
  "emoji",
  "task",
  "passed",
  "verif",
  "click",
  "rem",
  "enter"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
