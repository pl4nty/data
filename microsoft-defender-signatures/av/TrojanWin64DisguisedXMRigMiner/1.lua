-- Threat: Trojan:Win64/DisguisedXMRigMiner
-- Type: 10
-- MpAttributes: (PUA:Block:XMRig | Miner:XMRigRelated | (Miner:XMRigNoBlock & (PUA:Block:CoinMiner | PUA:Block:CoinMiner64)) & !PUA:Block:IdleBuddy & !PUA:Block:XMRStak & !PUAMiner:DisguisedXMRigException)

if peattributes.is_process then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.UfsGetMetadataStringA("LUAUFS:MinerDets", true)
if l_0_0 == 0 and l_0_1 ~= nil and string.find(l_0_1, "miner", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("PUA:")
if l_0_2 ~= nil and 0 < #l_0_2 then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = string.lower(l_0_4)
    if string.find(l_0_5, "torrent", 1, true) ~= nil then
      return mp.CLEAN
    end
    if string.find(l_0_5, "coinminer", 1, true) == nil and string.find(l_0_5, "namedminer", 1, true) == nil and string.find(l_0_5, "miner", 1, true) ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_6 = ""
local l_0_7 = ""
local l_0_8 = ""
local l_0_9 = ""
local l_0_10 = false
local l_0_11 = {
  ["0.0.com"] = true,
  kmspico = true,
  microsoft = true,
  ["microsoft corporation"] = true,
  ["oracle corporation"] = true,
  ["www.360.com"] = true,
  ["www.google.com"] = true,
  ["www.java.com"] = true,
  ["www.realtek.com"] = true,
  ["www.micorosoft.com"] = true,
  ["www.microsoft.com"] = true
}
local l_0_12 = {
  ["dllhostex.exe"] = true,
  ["explorer.exe"] = true,
  ["java.exe"] = true,
  ["microsofthost.exe"] = true,
  ["rtkauduservice.exe"] = true,
  ["runtimebroker.exe"] = true,
  ["safe.exe"] = true,
  ["services.exe"] = true,
  ["system.exe"] = true,
  ["taskmgr.exe"] = true,
  ["tiworker.exe"] = true,
  voice = true,
  ["winx.exe"] = true
}
local l_0_13 = {
  ["0 0"] = true,
  ["com surrogate"] = true,
  ["google crash handler"] = true,
  ["host process for windows services"] = true,
  ["java update"] = true,
  ["java(tm) platform se binary"] = true,
  kmspico = true,
  ["realtek hd audio service"] = true,
  ["runtime broker"] = true,
  ["services and controller app"] = true,
  svchost = true,
  system = true,
  ["taskmgr tools"] = true,
  voice = true,
  ["windows explorer"] = true,
  ["windows modules installer worker"] = true,
  ["windows x"] = true
}
local l_0_14 = {
  ["google update"] = true,
  java = true,
  ["microsoft corporation. all rights reserved."] = true,
  microsofthost = true,
  rtkauduservice = true,
  ["services and controller app"] = true,
  svchost = true,
  system = true,
  taskmgr = true,
  voice = true,
  ["windows x"] = true
}
local l_0_15 = {
  ["https://github.com/bendr0id/xmrigcc/"] = true,
  ["https://github.com/bendr0id/xmrigcc"] = true,
  ["https://github.com/bendr0id/xmrigcc-amd"] = true,
  ["www.xmrig.com"] = true
}
local l_0_16 = {
  ["xmrig.exe"] = true,
  ["xmrig-cuda.dll"] = true,
  ["xmrigminer.exe"] = true
}
local l_0_17 = {
  ["xmrig cpu miner"] = true,
  ["xmrig cuda miner"] = true,
  ["xmrig cuda plugin"] = true,
  ["xmrig miner"] = true,
  ["xmrig opencl miner"] = true,
  ["xmrigcc-amd opencl miner"] = true,
  ["xmrigcc command'n'control server"] = true,
  ["xmrigcc cpu miner"] = true
}
local l_0_18 = {xmrig = true, xmrigcc = true}
local l_0_19 = pe.get_versioninfo()
if l_0_19 ~= nil then
  l_0_10 = true
  l_0_6 = l_0_19.CompanyName
  l_0_7 = l_0_19.OriginalFilename
  l_0_8 = l_0_19.FileDescription
  l_0_9 = l_0_19.ProductName
  if l_0_6 then
    l_0_6 = string.lower(l_0_6)
  else
    l_0_6 = ""
  end
  if l_0_7 then
    l_0_7 = string.lower(l_0_7)
  else
    l_0_7 = ""
  end
  if l_0_8 then
    l_0_8 = string.lower(l_0_8)
  else
    l_0_8 = ""
  end
  if l_0_9 then
    l_0_9 = string.lower(l_0_9)
  else
    l_0_9 = ""
  end
  if l_0_11[l_0_6] or l_0_12[l_0_7] or l_0_13[l_0_8] or l_0_14[l_0_9] then
    return mp.INFECTED
  end
end
local l_0_20 = string.lower(mp.getfilename())
local l_0_21, l_0_22 = l_0_20:match("(.+\\)([^\\]+)$")
if string.sub(l_0_22, 1, 5) == "xmrig" then
  return mp.CLEAN
end
if l_0_10 and (l_0_15[l_0_6] or l_0_16[l_0_7] or l_0_17[l_0_8] or l_0_18[l_0_9]) then
  mp.set_mpattribute("Miner:HasXMRigFileProperty")
  return mp.CLEAN
end
return mp.INFECTED
