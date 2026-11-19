-- Threat: !InfrastructureShared
-- Name: 119641b1fc9c08
-- Type: 21
-- Includes: BMLuaLib

reportHeaders({"Host", "User-Agent"})
local l_0_0, l_0_1
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_2 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_3 = sigattr_tail[l_0_2]
  if l_0_3.attribute == 28768 and l_0_3.matched and l_0_3.utf8p1 then
    l_0_0 = l_0_3.utf8p1
  elseif l_0_3.attribute == 28769 and l_0_3.matched and l_0_3.utf8p1 then
    l_0_1 = l_0_3.utf8p1
  end
  if l_0_0 and l_0_1 then
    break
  end
end
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_4 = l_0_0 .. ":" .. l_0_1
local l_0_5 = {
  ["a0e9f5d64349fb13191bc781f81f42e1:ae4edc6faf64d08308082ad26be60767"] = true,
  ["72a589da586844d7f0818ce684948eea:ae4edc6faf64d08308082ad26be60767"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:f176ba63b4d68e576b5ba345bec2c7b7"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:ae4edc6faf64d08308082ad26be60767"] = true,
  ["294b2f1dc22c6e6c3231d2fe311d504b:ae4edc6faf64d08308082ad26be60767"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:e35df3e00ca4ef31d42b34bebaa2f86e"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:fd4bc6cea4877646ccd62f0792ec0b62"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:46e8c907c5cc3cf4b4420e76da5b4dba"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:b31c0b82752ea0e2c48b8ce46e9263e5"] = true,
  ["72a589da586844d7f0818ce684948eea:fd4bc6cea4877646ccd62f0792ec0b62"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:6d6b821affda5de6562d217770a7ead0"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:567bb420d39046dbfd1f68b558d86382"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:ec74a5c51106f0419184d0dd08fb05bc"] = true,
  ["51c64c77e60f3980eea90869b68c58a8:ae4edc6faf64d08308082ad26be60767"] = true,
  ["72a589da586844d7f0818ce684948eea:8cb68dc6ad0365d44af24b254ef70844"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:b7bd51222a09f3ad66a340710ae9c01a"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:8cb68dc6ad0365d44af24b254ef70844"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:b31c0b82752ea0e2c48b8ce46e9263e5"] = true,
  ["ce5f3254611a8c095a3d821d44539877:ae4edc6faf64d08308082ad26be60767"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:758945630046fd37070521b8544d1fe8"] = true,
  ["8916410db85077a5460817142dcbc8de:ae4edc6faf64d08308082ad26be60767"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:394441ab65754e2207b1e1b457b3641d"] = true,
  ["72a589da586844d7f0818ce684948eea:1af33e1657631357c73119488045302c"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:ccc514751b175866924439bdbb5bba34"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:beb7069ae409bccfed702c17ad004223"] = true,
  ["1770c51ee209c73547f5e53e366b6152:46e8c907c5cc3cf4b4420e76da5b4dba"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:1af33e1657631357c73119488045302c"] = true,
  ["51c64c77e60f3980eea90869b68c58a8:1af33e1657631357c73119488045302c"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:f176ba63b4d68e576b5ba345bec2c7b7"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:fd4bc6cea4877646ccd62f0792ec0b62"] = true,
  ["8916410db85077a5460817142dcbc8de:fd4bc6cea4877646ccd62f0792ec0b62"] = true,
  ["c35a61411ee5bdf666b4d64b05c29e64:ae4edc6faf64d08308082ad26be60767"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:6d6b821affda5de6562d217770a7ead0"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:466556e923186364e82cbdb4cad8df2c"] = true,
  ["72a589da586844d7f0818ce684948eea:649d6810e8392f63dc311eecb6b7098b"] = true,
  ["d0ec4b50a944b182fc10ff51f883ccf7:84aaf6d03fc8c5bfb56d1d188735b268"] = true,
  ["a0e9f5d64349fb13191bc781f81f42e1:098e26e2609212ac1bfac552fbe04127"] = true
}
if not l_0_5[l_0_4] then
  return mp.CLEAN
end
local l_0_6 = {}
l_0_6.TlsJa3CHash = l_0_0
l_0_6.TlsJa3SHash = l_0_1
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_6)
return mp.INFECTED
