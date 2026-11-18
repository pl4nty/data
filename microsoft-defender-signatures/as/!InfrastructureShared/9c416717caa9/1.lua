-- Threat: !InfrastructureShared
-- Name: 9c416717caa9
-- Type: 21

local l_0_0
if this_sigattrlog[4] and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 then
  local l_0_1 = {
    "\\kubectl.exe",
    "\\docker.exe",
    "\\terraform.exe",
    "\\consul.exe",
    "\\vault.exe",
    "\\nomad.exe",
    "\\helm.exe",
    "\\istioctl.exe",
    "\\go.exe",
    "\\gopls.exe",
    "\\dlv.exe",
    "\\prometheus.exe",
    "\\grafana-server.exe",
    "\\containerd.exe",
    "\\kubelet.exe",
    "\\etcd.exe",
    "\\traefik.exe",
    "\\caddy.exe",
    "\\minio.exe",
    "\\gh.exe"
  }
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if string.find(l_0_0, l_0_3, 1, true) then
      return mp.CLEAN
    end
  end
  if string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_4 = {}
for l_0_5 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_5].matched then
    if sigattr_head[l_0_5].attribute == 28768 then
      l_0_4.TlsJa3CHash = sigattr_head[l_0_5].utf8p1
    elseif sigattr_head[l_0_5].attribute == 28769 then
      l_0_4.TlsJa3SHash = sigattr_head[l_0_5].utf8p1
    end
  end
end
l_0_4.sliver_ja4 = "t13i1310_00_f57a46bbacb6_e5728521abd4"
l_0_4.sliver_ja4s = "t13130102_1301_a56c5b993250"
if l_0_0 then
  l_0_4.sliver_proc = l_0_0
end
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), l_0_4)
return mp.INFECTED
