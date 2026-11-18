-- Threat: !InfrastructureShared
-- Name: 920b38576f8bf
-- Type: 21
-- Includes: BMLuaLib

local function l_0_0(l_1_0)
  local l_1_1, l_1_2 = pcall(MpCommon.AtomicCounterValue, l_1_0)
  
  return l_1_1 and l_1_2 ~= nil
end

local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil then
  if l_0_0("linux_pkg_maintenance_active") or l_0_0("linux_config_mgmt_active") then
    return mp.CLEAN
  end
elseif l_0_1.ppid ~= nil and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end

local function l_0_2(l_2_0, l_2_1)
  return l_2_0 ~= nil and string.find(l_2_0, l_2_1, 1, true)
end

local l_0_3 = bm.get_imagepath() or ""
if l_0_3 ~= "" and (string.match(l_0_3, "/k3s$") or string.match(l_0_3, "/containerd$") or string.match(l_0_3, "/containerd%-shim")) then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
local l_0_5 = l_0_4 ~= nil and l_0_4.image_path or ""
if l_0_5 ~= "" and (string.match(l_0_5, "/k3s$") or string.match(l_0_5, "/containerd$") or string.match(l_0_5, "/containerd%-shim")) then
  return mp.CLEAN
end
local l_0_6 = l_0_1 ~= nil and l_0_1.command_line or ""
local l_0_7 = l_0_4 ~= nil and mp.GetProcessCommandLine(l_0_4.ppid) or ""
if l_0_6 == "" and (l_0_2(l_0_3, "/python") or l_0_2(l_0_3, "/platform-python") or l_0_2(l_0_3, "/perl") or l_0_2(l_0_3, "/qemu-")) then
  if l_0_0("linux_pkg_maintenance_active") then
    return mp.CLEAN
  end
  if l_0_0("linux_config_mgmt_active") then
    return mp.CLEAN
  end
end
if l_0_2(l_0_5, "/opt/sophos-av/engine/") or l_0_2(l_0_5, "/opt/sophos/engine/") or l_0_2(l_0_5, "/opt/deepinstinct/") or l_0_2(l_0_5, "/opt/kaspersky/kesl/") or l_0_2(l_0_5, "/opt/VRTSralus/bin/beremote") then
  return mp.CLEAN
end
if l_0_2(l_0_7, "/opt/deepinstinct/") or l_0_2(l_0_7, "/usr/sbin/debootstrap") or l_0_2(l_0_7, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_2(l_0_7, "/var/cache/apt/archives/") or l_0_2(l_0_7, "libpam-modules-bin") or l_0_2(l_0_7, "/usr/lib/apt/apt.systemd.daily") or l_0_2(l_0_7, "/usr/sbin/needrestart") or l_0_2(l_0_7, "/usr/bin/apt-key --quiet") or l_0_2(l_0_7, "/usr/libexec/qemu-binfmt/") or l_0_2(l_0_7, "apk add ") then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/usr/sbin/recover") or l_0_2(l_0_3, "/usr/bin/recover")) and l_0_2(l_0_6, "/usr/sbin/recover -s ") and l_0_2(l_0_6, " -a ") and l_0_2(l_0_6, " -I -") and l_0_2(l_0_6, " -x ") then
  return mp.CLEAN
end
local l_0_8, l_0_9, l_0_10 = pcall(bm.get_process_relationships)
if l_0_8 then
  if l_0_9 ~= nil then
    for l_0_11, l_0_12 in ipairs(l_0_9) do
      if l_0_12.image_path ~= nil then
        bm.add_related_process(l_0_12.ppid)
      end
    end
  end
  if l_0_10 ~= nil then
    for l_0_13, l_0_14 in ipairs(l_0_10) do
      if l_0_14.image_path ~= nil then
        bm.add_related_process(l_0_14.ppid)
        if string.find(l_0_14.image_path, "/rpmkeys", 1, true) then
          return mp.CLEAN
        end
        if string.find(l_0_14.image_path, "/dpkg-deb", 1, true) or string.find(l_0_14.image_path, "/dpkg-split", 1, true) or string.find(l_0_14.image_path, "/bin/dpkg", 1, true) or string.find(l_0_14.image_path, "/bin/dpkg-deb", 1, true) or string.find(l_0_14.image_path, "/bin/dpkg-split", 1, true) then
          return mp.CLEAN
        end
        local l_0_15 = l_0_14.cmd_line or ""
        if string.find(l_0_15, "/var/tmp/rpm-tmp.", 1, true) then
          return mp.CLEAN
        end
        if string.find(l_0_15, "/usr/bin/dpkg-deb", 1, true) or string.find(l_0_15, "/usr/bin/dpkg-split", 1, true) or string.find(l_0_15, "/bin/dpkg ", 1, true) or string.find(l_0_15, "/bin/dpkg-deb", 1, true) or string.find(l_0_15, "/bin/dpkg-split", 1, true) then
          return mp.CLEAN
        end
      end
    end
  end
end
reportRelatedBmHits()
return mp.INFECTED
