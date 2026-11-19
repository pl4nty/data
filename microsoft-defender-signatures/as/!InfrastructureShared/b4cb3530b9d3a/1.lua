-- Threat: !InfrastructureShared
-- Name: b4cb3530b9d3a
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
local l_0_6 = l_0_1 ~= nil and l_0_1.command_line or ""
local l_0_7 = l_0_4 ~= nil and mp.GetProcessCommandLine(l_0_4.ppid) or ""
if l_0_6 == "" and (l_0_2(l_0_3, "/python") or l_0_2(l_0_3, "/platform-python") or l_0_2(l_0_3, "/perl") or l_0_2(l_0_3, "/tar")) then
  if l_0_0("linux_config_mgmt_active") then
    return mp.CLEAN
  end
  if l_0_0("linux_pkg_maintenance_active") then
    return mp.CLEAN
  end
end
if l_0_2(l_0_5, "/opt/chef/embedded/bin/ruby") or l_0_2(l_0_5, "/opt/cinc/embedded/bin/ruby") or l_0_2(l_0_5, "/opt/sophos-av/engine/") or l_0_2(l_0_5, "/opt/sophos/engine/") or l_0_2(l_0_5, "/opt/deepinstinct/") or l_0_2(l_0_5, "/opt/VRTSralus/bin/beremote") or l_0_2(l_0_5, "/usr/bin/google_guest_agent") or l_0_2(l_0_5, "/usr/lib/google/guest_agent/") or l_0_2(l_0_5, "/opt/jc/bin/jumpcloud-agent") or l_0_2(l_0_5, "/opt/cyberark/epm/sbin/epmd") or l_0_2(l_0_5, "/opt/cyberark/epm/bin/epmcli") or l_0_2(l_0_5, "/opt/puppetlabs/puppet/bin/ruby") then
  return mp.CLEAN
end
if l_0_2(l_0_3, "/memfd:epmd") and l_0_2(l_0_6, "/opt/cyberark/epm/sbin/epmd --mode=SERVICE") then
  return mp.CLEAN
end
if l_0_2(l_0_7, "domainjoin-cli") or l_0_2(l_0_7, "/tmp/chef-script") or l_0_2(l_0_7, "/usr/bin/chef-client") or l_0_2(l_0_7, "/usr/bin/cinc-client") or l_0_2(l_0_7, "/opt/chef-workstation/bin/chef-cli") or l_0_2(l_0_7, "/etc/chef/client.rb") or l_0_2(l_0_7, "/etc/cinc/client.rb") or l_0_2(l_0_7, "/usr/lib/skylight/enable_smartcard") or l_0_2(l_0_7, "main_entrance.py --file snapshot.json") or l_0_2(l_0_7, "duo.fulluser.tar") or l_0_2(l_0_7, "config_ssh_pam_for_rt.sh") then
  return mp.CLEAN
end
if l_0_3 ~= "" and (string.match(l_0_3, "/k3s$") or string.match(l_0_3, "/containerd$") or string.match(l_0_3, "/containerd%-shim")) or l_0_5 ~= "" and (string.match(l_0_5, "/k3s$") or string.match(l_0_5, "/containerd$") or string.match(l_0_5, "/containerd%-shim")) then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/usr/bin/python") or l_0_2(l_0_3, "/python2") or l_0_2(l_0_3, "/python3")) and l_0_2(l_0_6, "/usr/sbin/sosreport") then
  return mp.CLEAN
end
if (string.match(l_0_3, "/login$") ~= nil or l_0_2(l_0_3, "/bin/login")) and (l_0_2(l_0_6, "/bin/login --") or l_0_2(l_0_6, " login --")) then
  return mp.CLEAN
end
if (string.match(l_0_3, "/rsync$") ~= nil or l_0_2(l_0_3, "/usr/bin/rsync") or l_0_2(l_0_3, "/bin/rsync")) and l_0_2(l_0_6, "rsync -") and not l_0_2(l_0_6, "/etc/pam.d/sshd") then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/bin/sh") or l_0_2(l_0_3, "/bin/bash")) and l_0_2(l_0_6, "install.sh") and l_0_2(l_0_6, "adbridge-") and l_0_2(l_0_6, ".rpm") and l_0_2(l_0_6, "purge") then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/opt/puppetlabs/puppet/bin/ruby") or l_0_2(l_0_3, "/usr/bin/puppet") or l_0_2(l_0_5, "/usr/bin/puppet")) and l_0_2(l_0_6, "puppet agent ") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "/usr/bin/puppet agent ") or l_0_2(l_0_6, "/bin/puppet agent ") or l_0_2(l_0_7, "/usr/bin/puppet agent ") or l_0_2(l_0_7, "/bin/puppet agent ") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "/usr/local/cpanel/bin/taskrun") and l_0_2(l_0_6, "/var/cpanel/updatelogs/") then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/opt/aquasec/") or l_0_2(l_0_5, "/opt/aquasec/") or l_0_2(l_0_6, "/opt/aquasec/") or l_0_2(l_0_7, "/opt/aquasec/") or l_0_2(l_0_3, "/var/lib/aquasec/") or l_0_2(l_0_5, "/var/lib/aquasec/") or l_0_2(l_0_6, "/var/lib/aquasec/") or l_0_2(l_0_7, "/var/lib/aquasec/")) and l_0_2(l_0_6, "config_pam_aquasec.sh") then
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
    if (l_0_2(l_4_2, "/opt/aquasec/config_pam_aquasec.sh") or l_0_2(l_4_2, "/var/lib/aquasec/config_pam_aquasec.sh") or l_0_2(l_4_2, "config_pam_aquasec.sh -r")) and (l_0_2(l_4_2, "/opt/aquasec/") or l_0_2(l_4_2, "/var/lib/aquasec/") or l_0_2(l_4_1, "/opt/aquasec/") or l_0_2(l_4_1, "/var/lib/aquasec/")) then
      return true
    end
    if l_0_2(l_4_2, "/usr/bin/puppet agent ") and l_0_2(l_4_2, "/usr/local/puppet/puppet4_cluster_checkin") then
      return true
    end
    return false
  end
  
  for l_3_4, l_3_5 in ipairs(l_3_1 or {}) do
    if l_3_3(l_3_5) then
      return true
    end
  end
  for l_3_6, l_3_7 in ipairs(l_3_2 or {}) do
    if l_3_3(l_3_7) then
      return true
    end
  end
  return false
end

if l_0_8() then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/bin/sh") or l_0_2(l_0_3, "/bin/bash") or l_0_2(l_0_5, "/bin/sh") or l_0_2(l_0_5, "/bin/bash")) and (l_0_2(l_0_6, "configure_install_identity.sh") or l_0_2(l_0_7, "configure_install_identity.sh")) then
  return mp.CLEAN
end

local function l_0_9()
  local l_5_0 = {
    "/emr/instance-controller/lib/bootstrap-actions/",
    "/usr/bin/instance-controller",
    "aws157.instancecontroller.Main"
  }
  if l_0_2(l_0_6, l_5_0[1]) or l_0_2(l_0_6, l_5_0[2]) or l_0_2(l_0_6, l_5_0[3]) then
    return true
  end
  local l_5_1, l_5_2 = pcall(bm.get_process_relationships)
  if not l_5_1 or l_5_2 == nil then
    return false
  end
  for l_5_3, l_5_4 in ipairs(l_5_2) do
    local l_5_5 = l_5_4.image_path or ""
    local l_5_6 = l_5_4.cmd_line or ""
    for l_5_7, l_5_8 in ipairs(l_5_0) do
      if l_0_2(l_5_5, l_5_8) or l_0_2(l_5_6, l_5_8) then
        return true
      end
    end
  end
  return false
end

if l_0_9() then
  return mp.CLEAN
end
if l_0_2(l_0_6, "tee -a /etc/pam.d/sshd") or l_0_2(l_0_7, "tee -a /etc/pam.d/sshd") then
  local l_0_10, l_0_11 = pcall(MpCommon.AtomicCounterValue, "linux_emr_instance_controller_active")
  if l_0_10 and l_0_11 ~= nil then
    return mp.CLEAN
  end
end
if (l_0_2(l_0_3, "/usr/bin/tar") or l_0_2(l_0_3, "/bin/tar")) and (l_0_2(l_0_6, ".pam.d_winbind_ubuntu.tar.gz") or l_0_2(l_0_6, ".pam.d_sssd_ubuntu.tar.gz") or l_0_2(l_0_6, "pam.nosssd.tar") or l_0_2(l_0_6, "duo.fulluser.tar")) then
  return mp.CLEAN
end
if (l_0_2(l_0_3, "/usr/bin/ln") or l_0_2(l_0_3, "/bin/ln")) and l_0_2(l_0_6, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") then
  local l_0_12 = l_0_4 ~= nil and mp.GetProcessCommandLine(l_0_4.ppid) or ""
  if l_0_2(l_0_5, "/authselect") or l_0_2(l_0_12, "authselect ") or l_0_2(l_0_12, "authconfig ") or l_0_2(l_0_12, "pam-auth-update") or l_0_2(l_0_12, "/usr/libexec/authselect/") or l_0_2(l_0_12, "/usr/lib/authselect/") then
    return mp.CLEAN
  end
end
if l_0_2(l_0_6, "dpkg") and l_0_2(l_0_6, "--status-fd") and (l_0_2(l_0_3, "/qemu-") or l_0_2(l_0_3, ".buildkit_qemu_emulator") or l_0_2(l_0_6, "qemu-binfmt") or l_0_2(l_0_6, ".buildkit_qemu_emulator")) then
  return mp.CLEAN
end
if l_0_2(l_0_6, "pam_slurm_adopt.so") and (l_0_2(l_0_7, "slurm-cluster-controller") or l_0_2(l_0_7, "slurm-controller") or l_0_2(l_0_7, "/usr/local/bin/entrypoint.sh") or l_0_2(l_0_7, "/usr/bin/supervisord")) then
  return mp.CLEAN
end
if l_0_2(l_0_6, "aws s3 cp") and l_0_2(l_0_6, "/files/etc/ /etc --recursive") and l_0_2(l_0_7, "/var/lib/cloud/instance/scripts/part-001") then
  return mp.CLEAN
end
if l_0_2(l_0_6, "cp ../pam.d2/ok.pam.d/") and l_0_2(l_0_6, "../pam.d2/ok.pam.d/sshd") and l_0_2(l_0_7, "-bash") then
  return mp.CLEAN
end
return mp.INFECTED
