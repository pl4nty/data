-- Threat: !InfrastructureShared
-- Name: 84b3967b9795
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {
  "\\windows\\system32",
  "%system%\\",
  "\\windows\\syswow64",
  "\\windows\\pxiesys.ini\\system32\\"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if contains(l_0_0, l_0_3, true) then
    return mp.CLEAN
  end
end
if sysio.IsFileExists(l_0_0) then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
