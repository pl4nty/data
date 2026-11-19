-- Threat: !InfrastructureShared
-- Name: 158eb319786d3a
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
local l_0_4 = mp.GetParentProcInfo()
local l_0_5 = l_0_4 ~= nil and l_0_4.image_path or ""
if l_0_3 ~= "" and (string.match(l_0_3, "/k3s$") or string.match(l_0_3, "/containerd$") or string.match(l_0_3, "/containerd%-shim")) or l_0_5 ~= "" and (string.match(l_0_5, "/k3s$") or string.match(l_0_5, "/containerd$") or string.match(l_0_5, "/containerd%-shim")) then
  return mp.CLEAN
end
local l_0_6 = l_0_1 ~= nil and l_0_1.command_line or ""
local l_0_7 = l_0_4 ~= nil and mp.GetProcessCommandLine(l_0_4.ppid) or ""
if l_0_6 == "" and (l_0_2(l_0_3, "/python") or l_0_2(l_0_3, "/platform-python") or l_0_2(l_0_3, "/perl")) then
  if l_0_0("linux_pkg_maintenance_active") then
    return mp.CLEAN
  end
  if l_0_0("linux_config_mgmt_active") then
    return mp.CLEAN
  end
end
if l_0_2(l_0_5, "/opt/sophos-av/engine/") or l_0_2(l_0_5, "/opt/sophos/engine/") or l_0_2(l_0_5, "/opt/deepinstinct/") or l_0_2(l_0_5, "/opt/kaspersky/kesl/") or l_0_2(l_0_5, "/opt/aquasec/") or l_0_2(l_0_5, "/var/lib/aquasec/") or l_0_2(l_0_5, "/opt/CA/AccessControl/") or l_0_2(l_0_5, "/opt/jc/lib/") or l_0_2(l_0_5, "/opt/VRTSralus/bin/beremote") or l_0_2(l_0_5, "/usr/local/manageengine/uems_agent/bin/dcconfig") or l_0_2(l_0_5, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_5, "/opt/puppetlabs/puppet/bin/ruby") then
  return mp.CLEAN
end
if l_0_2(l_0_7, "/aquasec/") or l_0_2(l_0_7, "/opt/CA/AccessControl/") or l_0_2(l_0_7, "/opt/jc/lib/") or l_0_2(l_0_7, "install_pam.sh -s") or l_0_2(l_0_7, "/etc/pingid/libtool") or l_0_2(l_0_7, "/opt/deepinstinct/") or l_0_2(l_0_7, "/usr/sbin/debootstrap") or l_0_2(l_0_7, "/lib/security/howdy/") or l_0_2(l_0_7, "/usr/lib/security/howdy/") or l_0_2(l_0_7, "howdy add") or l_0_2(l_0_7, "howdy config") or l_0_2(l_0_7, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_2(l_0_7, "/var/cache/apt/archives/") or l_0_2(l_0_7, "libpam-modules-bin") then
  return mp.CLEAN
end
if l_0_2(l_0_7, "BECOME-SUCCESS") and (l_0_2(l_0_7, "/usr/bin/python3") or l_0_2(l_0_6, "/usr/bin/python3")) then
  return mp.CLEAN
end
if l_0_2(l_0_6, "pam_duo.so") or l_0_2(l_0_7, "pam_duo.so") or l_0_2(l_0_6, "duo_unix-") or l_0_2(l_0_7, "duo_unix-") or l_0_2(l_0_6, "pam_authlite.so") or l_0_2(l_0_7, "pam_authlite.so") or l_0_2(l_0_6, "/opt/pmpagent/manageengine/uems_agent/") or l_0_2(l_0_7, "/opt/pmpagent/manageengine/uems_agent/") or l_0_2(l_0_6, "timeshift/snapshots/") or l_0_2(l_0_7, "timeshift/snapshots/") or l_0_2(l_0_6, "dlib_face_recognition_resnet_model") or l_0_2(l_0_7, "dlib_face_recognition_resnet_model") or l_0_2(l_0_6, "mmod_human_face_detector.dat") or l_0_2(l_0_7, "mmod_human_face_detector.dat") or l_0_2(l_0_6, "shape_predictor_5_face_landmarks.dat") or l_0_2(l_0_7, "shape_predictor_5_face_landmarks.dat") or l_0_2(l_0_6, "pam_systemd.so.restoreme") or l_0_2(l_0_7, "pam_systemd.so.restoreme") or l_0_2(l_0_6, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_7, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_3, "/dracut-install") or l_0_2(l_0_5, "/dracut-install") or l_0_2(l_0_6, "/usr/lib/dracut/dracut-install") or l_0_2(l_0_7, "/usr/lib/dracut/dracut-install") or l_0_2(l_0_3, "/e4defrag") or l_0_2(l_0_5, "/e4defrag") or l_0_2(l_0_6, "systemd-detect-virt") or l_0_2(l_0_6, "locale charmap") or l_0_2(l_0_3, "/cmake") or l_0_2(l_0_5, "/cmake") then
  return mp.CLEAN
end

local function l_0_8()
  local l_3_0, l_3_1, l_3_2 = pcall(bm.get_process_relationships)
  if not l_3_0 then
    return false
  end
  
  local function l_3_3(l_4_0)
    if l_4_0 == nil then
      return false
    end
    local l_4_1 = l_4_0.image_path or ""
    local l_4_2 = l_4_0.cmd_line or ""
    if l_0_2(l_4_2, "/opt/jc/lib/") then
      return true
    end
    if (l_0_2(l_4_2, "authselect create-profile authlite") or l_0_2(l_4_2, "authselect select authlite")) and (l_0_2(l_0_6, "/usr/bin/cmake -P") or l_0_2(l_0_7, "make install") or l_0_2(l_4_2, "make install")) then
      return true
    end
    if l_0_2(l_4_2, "ansible.module_utils._embed.dnf") then
      return true
    end
    if l_0_2(l_4_2, "/usr/bin/dpkg-maintscript-helper") and l_0_2(l_4_2, " upgrade ") then
      return true
    end
    if l_0_2(l_4_2, "PackageKit.StateHasChanged cache-update") and (l_0_2(l_4_1, "/gdbus") or l_0_2(l_4_2, "/usr/bin/gdbus")) then
      return true
    end
    return false
  end
  
  for l_3_4, l_3_5 in ipairs(l_3_2 or {}) do
    if l_3_3(l_3_5) then
      return true
    end
  end
  for l_3_6, l_3_7 in ipairs(l_3_1 or {}) do
    if l_3_3(l_3_7) then
      return true
    end
  end
  return false
end

if l_0_8() then
  return mp.CLEAN
end
if (l_0_2(l_0_6, "/usr/bin/cmake -P") or l_0_2(l_0_7, "make install")) and (l_0_2(l_0_7, "authselect create-profile authlite") or l_0_2(l_0_7, "authselect select authlite") or l_0_2(l_0_6, "authselect create-profile authlite") or l_0_2(l_0_6, "authselect select authlite")) then
  return mp.CLEAN
end
if l_0_2(l_0_6, "/bin/sh /usr/sbin/ldconfig") and l_0_2(l_0_7, "/var/lib/dpkg/info/libc-bin.postinst triggered ldconfig") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "sh -i -c yum update-minimal --security -y") and l_0_2(l_0_7, "sudo -S -- sh -i -c yum update-minimal --security -y") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "bash -c tdnf install -y util-linux") and (l_0_2(l_0_7, "/usr/bin/containerd-shim-runc-v2") or l_0_2(l_0_5, "/usr/bin/containerd-shim-runc-v2")) then
  return mp.CLEAN
end
if l_0_2(l_0_6, "/usr/bin/dnf --quiet -y upgrade") and l_0_2(l_0_7, "/usr/bin/salt-minion") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "/etc/cron.daily/snow") and l_0_2(l_0_6, "xClient 01010011011011100110111101110111") or l_0_2(l_0_7, "/etc/cron.daily/snow") and l_0_2(l_0_7, "xClient 01010011011011100110111101110111") then
  return mp.CLEAN
end
if l_0_2(l_0_3, "/usr/bin/python3") and l_0_2(l_0_6, "/usr/bin/yum") and l_0_2(l_0_6, "/usr/local/manageengine/uems_agent/") or l_0_2(l_0_7, "/usr/local/manageengine/uems_agent/bin/dcconfig") then
  return mp.CLEAN
end
if l_0_2(l_0_7, "puppet agent: applying configuration") and l_0_2(l_0_6, "yum ") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "harden-cis-safe.sh") and l_0_2(l_0_6, "pam_faillock.so") or l_0_2(l_0_7, "harden-cis-safe.sh") and l_0_2(l_0_6, "pam_faillock.so") then
  return mp.CLEAN
end
if l_0_2(l_0_3, "/opt/MXB/bin/BackupFP") and l_0_2(l_0_6, "/opt/MXB/bin/BackupFP") or l_0_2(l_0_5, "/opt/MXB/bin/BackupFP") and l_0_2(l_0_7, "/opt/MXB/bin/BackupFP") then
  return mp.CLEAN
end
if l_0_2(l_0_3, "keytool") and (l_0_2(l_0_6, "-importcert") or l_0_2(l_0_6, "-import ")) and l_0_2(l_0_6, "-keystore /lib/security/cacerts") or l_0_2(l_0_5, "keytool") and (l_0_2(l_0_7, "-importcert") or l_0_2(l_0_7, "-import ")) and l_0_2(l_0_7, "-keystore /lib/security/cacerts") then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/usr/sbin/recover") or l_0_2(l_0_3, "/usr/bin/recover")) and (l_0_2(l_0_6, "/usr/sbin/recover -s ") or l_0_2(l_0_6, "/usr/bin/recover -s ")) and l_0_2(l_0_6, " -a ") and l_0_2(l_0_6, " -I -") and l_0_2(l_0_6, " -x ") then
  return mp.CLEAN
end
local l_0_9, l_0_10, l_0_11 = pcall(bm.get_process_relationships)
if l_0_9 then
  if l_0_10 ~= nil then
    for l_0_12, l_0_13 in ipairs(l_0_10) do
      if l_0_13.image_path ~= nil then
        bm.add_related_process(l_0_13.ppid)
      end
    end
  end
  if l_0_11 ~= nil then
    for l_0_14, l_0_15 in ipairs(l_0_11) do
      if l_0_15.image_path ~= nil then
        bm.add_related_process(l_0_15.ppid)
        if string.find(l_0_15.image_path, "/rpmkeys", 1, true) then
          return mp.CLEAN
        end
        if string.find(l_0_15.image_path, "/dpkg-deb", 1, true) or string.find(l_0_15.image_path, "/dpkg-split", 1, true) or string.find(l_0_15.image_path, "/bin/dpkg", 1, true) or string.find(l_0_15.image_path, "/bin/dpkg-deb", 1, true) or string.find(l_0_15.image_path, "/bin/dpkg-split", 1, true) then
          return mp.CLEAN
        end
        local l_0_16 = l_0_15.cmd_line or ""
        if string.find(l_0_16, "/var/tmp/rpm-tmp.", 1, true) then
          return mp.CLEAN
        end
        if string.find(l_0_16, "/usr/bin/dpkg-deb", 1, true) or string.find(l_0_16, "/usr/bin/dpkg-split", 1, true) or string.find(l_0_16, "/bin/dpkg ", 1, true) or string.find(l_0_16, "/bin/dpkg-deb", 1, true) or string.find(l_0_16, "/bin/dpkg-split", 1, true) then
          return mp.CLEAN
        end
      end
    end
  end
end
reportRelatedBmHits()
return mp.INFECTED
