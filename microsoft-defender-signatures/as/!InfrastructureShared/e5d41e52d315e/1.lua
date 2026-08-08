-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e5d41e52d315e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetURI)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_1 = (this_sigattrlog[2]).utf8p2
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_1 = (this_sigattrlog[3]).utf8p2
  else
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
      l_0_1 = (this_sigattrlog[4]).utf8p2
    else
      if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
        l_0_1 = (this_sigattrlog[5]).utf8p2
      end
    end
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC125: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC126: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC127: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC128: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC129: Overwrote pending register: R3 in 'AssignReg'

local l_0_3 = "0xrpc.io"
-- DECOMPILER ERROR at PC130: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "1rpc.io"
-- DECOMPILER ERROR at PC131: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC132: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("api-ethereum-mainnet-reth.n.dwellir.com")("api.mycryptoapi.com") do
  -- DECOMPILER ERROR at PC135: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC137: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R13 in 'AssignReg'

end
if l_0_4 >= (("endpoints.omniatech.io").len)("eth-mainnet.4everland.org") or (string.find)(l_0_0, "eth-mainnet.g.alchemy.com", "eth-mainnet.nodereal.io", true) == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_10 = AddToAtomicCounter("ethrpc_seen_" .. l_0_1 .. "_" .. l_0_3, 1, 600)
if l_0_10 ~= 0 then
  return mp.CLEAN
end
local l_0_11 = AddToAtomicCounter("ethrpc_cnt_" .. l_0_1, 1, 600)
local l_0_12 = l_0_11 + 1
if l_0_12 >= 4 then
  local l_0_13 = reportHeaders
  local l_0_14 = {}
  -- DECOMPILER ERROR at PC191: No list found for R9 , SetList fails

  l_0_13(l_0_14)
  -- DECOMPILER ERROR at PC194: Overwrote pending register: R8 in 'AssignReg'

  return l_0_13
end
do
  do
    -- DECOMPILER ERROR at PC196: Overwrote pending register: R8 in 'AssignReg'

    do return l_0_13.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

