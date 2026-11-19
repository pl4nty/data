-- Threat: Trojan:Win64/DisguisedCoinMiner
-- Type: 10
-- MpAttributes: (PUA:Block:XMRig | PUA:Block:ClaymoreCryptoNote | PUA:Block:PhoenixMiner | PUA:Block:YetAnotherMiner | PUA:Block:CoinMiner | PUA:Block:CoinMiner64)

local l_0_0 = {
  ["appmodule.exe"] = true,
  ["kernel.exe"] = true,
  ["microsofthost.exe"] = true,
  ["network02.exe"] = true,
  ["svchost.exe"] = true,
  ["svchost.exe.exe"] = true,
  ["syswow.exe"] = true,
  ["uihost32.exe"] = true,
  ["uihost64.exe"] = true,
  ["window.exe"] = true,
  ["wxm.exe"] = true
}
if peattributes.is_process then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
local l_0_2, l_0_3 = l_0_1:match("(.+\\)([^\\]+)$")
if l_0_3 ~= nil and l_0_0[l_0_3] then
  return mp.INFECTED
end
return mp.CLEAN
