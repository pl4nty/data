-- Threat: !InfrastructureShared
-- Name: 9cb385820438
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if not contains(l_0_0, {
  "rundll32.exe",
  "rundll32-low.exe",
  "connectdetector.exe",
  "program files",
  "iscurrentjobalreadyrunning.exe",
  "musnotification.exe"
}) then
  return mp.INFECTED
end
return mp.CLEAN
