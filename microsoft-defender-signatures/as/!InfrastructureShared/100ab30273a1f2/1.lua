-- Threat: !InfrastructureShared
-- Name: 100ab30273a1f2
-- Type: 21

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_0 == "" then
    return false
  end
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_3, 1, true) ~= nil then
      return true
    end
  end
  return false
end

local l_0_1 = {
  "/.codex/packages/",
  "/.local/share/claude/versions/",
  "/.local/bin/copilot",
  "/.copilot-cli/",
  "/usr/sbin/sshd",
  "/sshd-session"
}
local l_0_2 = {
  "/var/lib/waagent/",
  "/var/lib/guestconfig/",
  "/opt/az/bin/python",
  "/qualys/command-agent/bin/qualys-scan-util",
  "/lib/apt/methods/http",
  "/lib/apt/methods/https",
  "/usr/bin/apt-get",
  "/git-core/git-remote-http",
  "/git-core/git-remote-https",
  "/.vscode-server/",
  "/usr/sbin/wdavdaemon",
  "/.cache/copilot/",
  "/.orca-remote/runtimes/",
  "/usr/lib/snapd/snapd",
  "/usr/local/bin/azsecd",
  "/opt/ninja/bin/ninja"
}
local l_0_3 = {
  "export-agent-config.py",
  "/.claude/skills/",
  "/.fleet-config/",
  "/.orca/agent-hooks/",
  "/etc/update-motd",
  "apt.systemd.daily",
  "/var/lib/dpkg/info/",
  "apt-get update",
  "/usr/bin/az ",
  "msftlinuxpatchcore.py",
  "msftlinuxpatchautoassess.sh",
  "walinuxagent",
  "mdeinstallerwrapper.py",
  "mdeextensionhandler.py",
  "127.0.0.1:4141",
  "localhost:4141",
  "127.0.0.1:42419",
  "git fetch ",
  "git credential-store"
}
local l_0_4 = string.lower(bm.get_imagepath() or "")
if l_0_0(l_0_4, l_0_1) or l_0_0(l_0_4, l_0_2) then
  return mp.CLEAN
end
local l_0_5 = bm.get_current_process_startup_info()
local l_0_6 = l_0_5 and l_0_5.ppid and string.lower(mp.GetProcessCommandLine(l_0_5.ppid) or "") or ""
if l_0_0(l_0_6, l_0_3) then
  return mp.CLEAN
end
local l_0_7, l_0_8 = bm.get_process_relationships()
if l_0_7 ~= nil then
  for l_0_9, l_0_10 in ipairs(l_0_7) do
    local l_0_11 = string.lower(l_0_10.image_path or "")
    if l_0_0(l_0_11, l_0_2) then
      return mp.CLEAN
    end
    local l_0_12 = l_0_10.ppid and string.lower(mp.GetProcessCommandLine(l_0_10.ppid) or "") or ""
    if l_0_0(l_0_12, l_0_3) then
      return mp.CLEAN
    end
  end
end
if l_0_8 ~= nil then
  for l_0_13, l_0_14 in ipairs(l_0_8) do
    local l_0_15 = string.lower(l_0_14.image_path or "")
    if l_0_0(l_0_15, l_0_2) then
      return mp.CLEAN
    end
    local l_0_16 = l_0_14.ppid and string.lower(mp.GetProcessCommandLine(l_0_14.ppid) or "") or ""
    if l_0_0(l_0_16, l_0_3) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
