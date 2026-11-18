-- Threat: !InfrastructureShared
-- Name: 73d727f1feb1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 70 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil and l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_4
l_0_4 = {
  "tinyurl.com",
  ".replace(",
  "discord.com-api-webhooks",
  ")|iex;",
  "habilitar",
  "captcha",
  "cl\204\178o\204\178u\204\178d\204\178f\204\178l\204\178a\204\178r\204\178e\204\178\194\169_ve\204\178r\204\178i\204\178f\204\178i\204\178c\204\178a\204\178t\204\178i\204\178o\204\178n\204\178",
  "human"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
