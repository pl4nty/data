-- Threat: !InfrastructureShared
-- Name: !#Lua:EvilLattice
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: AGGR:FileWithMeshConfig

local l_0_0 = mp.getfilesize()
if 4096000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
local l_0_2 = l_0_1:match("ver=w.+/a...t....x")
mp.readprotection(true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = ExtractPartsFromUri(l_0_2)
local l_0_4 = l_0_3.host:match("%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?")
local l_0_5 = {}
l_0_5[1] = l_0_3.host
if l_0_4 == nil then
  local l_0_6 = StringSplit(l_0_3.host, ".")
  local l_0_7 = #l_0_6
  if 2 < l_0_7 then
    l_0_5[2] = table.concat(l_0_6, ".", l_0_7 - 2, l_0_7)
    l_0_5[3] = table.concat(l_0_6, ".", l_0_7 - 1, l_0_7)
  end
end
local l_0_8 = 220
for l_0_9 = 1, #l_0_5 do
  if l_0_5[l_0_9] ~= nil then
    local l_0_10 = "2*ow;" .. l_0_5[l_0_9] .. "=htj3g"
    local l_0_11, l_0_12 = MpCommon.NidSearch(l_0_8, crypto.CRC32Buffer(-1, string.lower(l_0_10), 0, string.len(l_0_10)))
    if l_0_11 == true then
      local l_0_13, l_0_14 = string.find(l_0_12, "NID:EvilRebar", 1, true)
      if l_0_13 ~= nil then
        local l_0_15 = "Lua:EvilRebar" .. string.sub(l_0_12, l_0_14 + 1, -1)
        mp.set_mpattribute(l_0_15)
        return mp.INFECTED
      end
      local l_0_16, l_0_17 = string.find(l_0_12, "NID:EvilLattice", 1, true)
      if l_0_16 ~= nil then
        local l_0_18 = "Lua:EvilLattice" .. string.sub(l_0_12, l_0_17 + 1, -1)
        mp.set_mpattribute(l_0_18)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
