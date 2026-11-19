-- Threat: !InfrastructureShared
-- Name: !#LUA:FileSizes.B
-- Type: 12

local l_0_0 = mp.getfilesize()
local l_0_1 = {
  [256] = "100",
  [1024] = "400",
  [4096] = "1000",
  [10240] = "10KB",
  [50000] = "50KB",
  [65536] = "10000",
  [262144] = "40000",
  [1048576] = "1M",
  [4194304] = "4M",
  [10485760] = "10M",
  [20971520] = "20M",
  [33554432] = "32M",
  [41943040] = "40M",
  [104857600] = "100M",
  [524288000] = "500M",
  [1073741824] = "1G"
}
for l_0_2, l_0_3 in pairs(l_0_1) do
  if l_0_2 >= l_0_0 then
    mp.set_mpattribute("LUA:FileSizeLE" .. l_0_3 .. ".B")
  else
    mp.set_mpattribute("LUA:FileSizeGT" .. l_0_3 .. ".B")
  end
end
return mp.CLEAN
