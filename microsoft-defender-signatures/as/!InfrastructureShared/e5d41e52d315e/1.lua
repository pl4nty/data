-- Threat: !InfrastructureShared
-- Name: e5d41e52d315e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = nri.GetURI()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "0xrpc.io",
  "1rpc.io",
  "api-ethereum-mainnet-reth.n.dwellir.com",
  "api.mycryptoapi.com",
  "api.stateless.solutions",
  "api.zan.top",
  "cloudflare-eth.com",
  "endpoints.omniatech.io",
  "eth-mainnet.4everland.org",
  "eth-mainnet.g.alchemy.com",
  "eth-mainnet.nodereal.io",
  "eth-mainnet.public.blastapi.io",
  "eth-mainnet.rpcfast.com",
  "eth.api.onfinality.io",
  "eth.api.pocket.network",
  "eth.blockrazor.xyz",
  "eth.drpc.org",
  "eth.llamarpc.com",
  "eth.meowrpc.com",
  "eth.merkle.io",
  "eth.rpc.blxrbdn.com",
  "eth1.lava.build",
  "ethereum-json-rpc.stakely.io",
  "ethereum-mainnet.gateway.tatum.io",
  "ethereum-public.nodies.app",
  "ethereum-rpc.publicnode.com",
  "ethereum.public.blockpi.network",
  "ethereumnodelight.app.runonflux.io",
  "gateway.tenderly.co",
  "go.getblock.io",
  "mainnet.eth.cloud.ava.do",
  "mainnet.gateway.tenderly.co",
  "mainnet.rpc.sentio.xyz",
  "openapi.bitstack.com",
  "public-eth.nownodes.io",
  "rpc.ankr.com",
  "rpc.blocknative.com",
  "rpc.chain49.com",
  "rpc.eth.gateway.fm",
  "rpc.flashbots.net",
  "rpc.fullsend.to",
  "rpc.graffiti.farm",
  "rpc.mevblocker.io",
  "rpc.owlracle.info",
  "rpc.polysplit.cloud",
  "rpc.swiftnodes.io",
  "rpcfree.com",
  "services.tokenview.io",
  "singapore.rpc.blxrbdn.com",
  "uk.rpc.blxrbdn.com",
  "virginia.rpc.blxrbdn.com",
  "virtual.mainnet.rpc.tenderly.co"
}
local l_0_3
local l_0_4 = 0
for l_0_5, l_0_6 in ipairs(l_0_2) do
  if l_0_4 < string.len(l_0_6) and string.find(l_0_0, l_0_6, 1, true) ~= nil then
    l_0_3 = l_0_6
    l_0_4 = string.len(l_0_6)
  end
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_7 = AddToAtomicCounter("ethrpc_seen_" .. l_0_1 .. "_" .. l_0_3, 1, 600)
if l_0_7 ~= 0 then
  return mp.CLEAN
end
local l_0_8 = AddToAtomicCounter("ethrpc_cnt_" .. l_0_1, 1, 600)
local l_0_9 = l_0_8 + 1
if 4 <= l_0_9 then
  reportHeaders({"Host", "User-Agent"})
  return mp.INFECTED
end
return mp.CLEAN
