-- Threat: !InfrastructureShared
-- Name: 9cb3034a53ea
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
local l_0_1 = {
  "regsvr32.exe",
  "regsvr32_wow64.exe",
  "regsvr32internal.exe",
  "regsvr32_x64.exe",
  "regsvr32_x86.exe",
  "regsvr32_0.exe",
  "program files",
  "\\windows\\installer\\",
  "wilcomregsvr32setup.exe",
  "nemu-backup.exe",
  "nemu9-backup.exe"
}
if not contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
