-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/ClickFix.MUP!MTB
-- Type: 13
-- MpAttributes: TEL:Trojan:WIn32/ClickFix.MUL

local l_0_0 = tostring(headerpage)
if l_0_0 ~= nil and string.lower(l_0_0):find("//dot.net/", 1, true) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path or "")
  if l_0_2:find("\\copilot.exe", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
