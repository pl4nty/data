-- Threat: !InfrastructureShared
-- Name: 12eb3010c9c80
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
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
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_2 = 140
local l_0_3 = 141
local l_0_4 = this_sigattrlog[5].matched
local l_0_5 = {}
l_0_5.webshell_implant = l_0_0
if l_0_4 then
  l_0_5.nid_ja3c_match = "NRI:JA3C:Backdoor:Win32/SliverC2.mTLS"
end
if this_sigattrlog[6].matched then
  l_0_5.nid_ja3s_match = "NRI:JA3S:Backdoor:Win32/SliverC2.mTLS"
end
for l_0_6 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_6].matched then
    if sigattr_head[l_0_6].attribute == 28768 then
      local l_0_7 = sigattr_head[l_0_6].utf8p1
      if l_0_7 then
        l_0_5.TlsJa3CHash = l_0_7
        local l_0_8, l_0_9 = MpCommon.SNidSearch(l_0_2, "00000000" .. l_0_7)
        if l_0_8 then
          l_0_5.nid_ja3c_match = l_0_9
          l_0_4 = true
        end
      end
    elseif sigattr_head[l_0_6].attribute == 28769 then
      local l_0_10 = sigattr_head[l_0_6].utf8p1
      if l_0_10 then
        l_0_5.TlsJa3SHash = l_0_10
        local l_0_11, l_0_12 = MpCommon.SNidSearch(l_0_3, "00000000" .. l_0_10)
        if l_0_11 then
          l_0_5.nid_ja3s_match = l_0_12
        end
      end
    end
  end
end
if not l_0_4 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1505.003", "SliverWebShell")
TrackPidAndTechniqueBM("BM", "T1071.001", "SliverWebShell")
bm.add_related_string("JA3C: ", l_0_5.TlsJa3CHash or "", bm.RelatedStringBMReport)
bm.add_related_string("JA3S: ", l_0_5.TlsJa3SHash or "", bm.RelatedStringBMReport)
bm.add_related_string("NID_JA3C: ", l_0_5.nid_ja3c_match or "", bm.RelatedStringBMReport)
return mp.INFECTED
