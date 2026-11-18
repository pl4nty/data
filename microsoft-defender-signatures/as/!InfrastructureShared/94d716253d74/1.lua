-- Threat: !InfrastructureShared
-- Name: 94d716253d74
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
  "start-process",
  " iex",
  "|iex",
  "[guid]::newguid",
  "| iex",
  "ping",
  "hidden",
  "invoke-expression"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  ".pptx",
  ".docx",
  "otp verification",
  "calc",
  "verify-clients.com",
  ".pdf"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED
