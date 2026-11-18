-- Threat: !InfrastructureShared
-- Name: 65d7f7566c26
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
local l_0_4 = MpCommon.GetImagePathFromPid(l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
if not contains(l_0_4, {
  "powershell.exe",
  "cmd.exe",
  "mshta.exe"
}) then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
  local l_1_1 = {
    "[\240][\159][\128-\191][\128-\191]",
    "[\240][\158][\128-\191][\128-\191]",
    "[\226][\156][\128-\191]",
    "[\226][\157][\128-\191]",
    "[\239][\184][\143]",
    "[\240][\159][\135-\137][\128-\191]",
    "[\240][\159][\135][\160-\191]",
    "[\240][\159][\135][\128-\159]",
    "[\240][\159][\132][\128-\191]",
    "[\226][\128][\141]",
    "[\226][\132][\150]",
    "[\226][\132][\151]"
  }
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if l_1_0:match(l_1_3) then
      return true
    end
  end
  return false
end

if l_0_5(l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
