-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3d8c53840\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0, l_1_1)
  -- function num : 0_0
  do
    if l_1_0 ~= nil then
      local l_1_2 = (string.find)(l_1_0, l_1_1, 1, true)
    else
    end
    return false
  end
end

do
  local l_0_2 = (bm.get_imagepath)() or ""
  local l_0_3 = nil
  do
    local l_0_4 = nil
    do
      local l_0_5 = nil
      if (function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_1
  if l_0_1(l_2_0, "/domainjoin-cli") or l_0_1(l_2_0, "domainjoin-cli") then
    return true
  end
  local l_2_2 = l_0_1
  local l_2_3 = l_2_1
  do
    local l_2_4 = "domainjoin-cli"
    do return l_2_2(l_2_3, l_2_4) end
    -- DECOMPILER ERROR at PC19: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end
)(l_0_3, l_0_0 ~= nil and l_0_0.command_line or "") then
        return mp.CLEAN
      end
      do
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

        if (function(l_3_0, l_3_1)
  -- function num : 0_2 , upvalues : l_0_1
  if l_0_1(l_3_0, "/opt/chef/embedded/bin/ruby") or l_0_1(l_3_0, "/opt/cinc/embedded/bin/ruby") or l_0_1(l_3_0, "/opt/chef-workstation/embedded/bin/ruby") or l_0_1(l_3_0, "/usr/bin/chef-client") or l_0_1(l_3_0, "/usr/bin/cinc-client") or l_0_1(l_3_0, "chef-client") or l_0_1(l_3_0, "cinc-client") then
    return true
  end
  if not l_0_1(l_3_1, "/tmp/chef-script") and not l_0_1(l_3_1, "/usr/bin/chef-client") and not l_0_1(l_3_1, "/usr/bin/cinc-client") and not l_0_1(l_3_1, "/opt/chef-workstation/bin/chef-cli") and not l_0_1(l_3_1, "/etc/chef/client.rb") then
    return l_0_1(l_3_1, "/etc/cinc/client.rb")
  end
end
)(l_0_3, l_0_0 ~= nil and l_0_0.command_line or "") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC95: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC102: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC109: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC109: Unhandled construct in 'MakeBoolean' P3

        if (l_0_3 ~= "" and (string.match)(l_0_3, "/k3s$")) or (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or "" ~= "" and ((string.match)((mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or "", "/k3s$") or (string.match)((mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or "", "/containerd$") or (string.match)((mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or "", "/containerd%-shim")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC129: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/usr/bin/python") or l_0_1(l_0_3, "/python2") or l_0_1(l_0_3, "/python3")) and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "/usr/sbin/sosreport") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC151: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC157: Confused about usage of register: R5 in 'UnsetPending'

        if ((string.match)(l_0_3, "/login$") ~= nil or l_0_1(l_0_3, "/bin/login")) and (l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "/bin/login --") or l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", " login --")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC185: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R5 in 'UnsetPending'

        if ((string.match)(l_0_3, "/rsync$") ~= nil or l_0_1(l_0_3, "/usr/bin/rsync") or l_0_1(l_0_3, "/bin/rsync")) and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "rsync -") and not l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "/etc/pam.d/sshd") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC212: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC218: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC224: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC230: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/bin/sh") or l_0_1(l_0_3, "/bin/bash")) and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "install.sh") and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "adbridge-") and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", ".rpm") and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "purge") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC239: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC245: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_1((mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or "", "/opt/puppetlabs/puppet/bin/ruby") and l_0_1(l_0_0 ~= nil and l_0_0.command_line or "", "yum ") then
          return mp.CLEAN
        end
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC256: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

