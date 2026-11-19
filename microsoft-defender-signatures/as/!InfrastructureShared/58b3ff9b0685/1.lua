-- Threat: !InfrastructureShared
-- Name: 58b3ff9b0685
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = NormalizeCmdline("powershell", l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not contains(l_0_1, {
  "VMWare",
  "Hyper-V",
  "Parallels",
  "Oracle VM VirtualBox",
  "Citrix Hypervisor",
  "QEMU",
  "Proxmox VE",
  "Docker"
}) then
  return mp.CLEAN
end
return mp.INFECTED
