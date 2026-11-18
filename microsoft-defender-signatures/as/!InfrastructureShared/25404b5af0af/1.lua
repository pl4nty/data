-- Threat: !InfrastructureShared
-- Name: 25404b5af0af
-- Type: 21
-- Includes: BMLuaLib

if mp.get_mpattribute("RPF:TopLevelFile") == false then
  return mp.CLEAN
end
if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = {
  "\\system32\\",
  "\\syswow64\\",
  "\\program files\\",
  "\\program files (x86)\\"
}
local l_0_1 = mp.getfilename()
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
  if contains(l_0_1, l_0_0) then
    return mp.CLEAN
  end
end
return mp.INFECTED
