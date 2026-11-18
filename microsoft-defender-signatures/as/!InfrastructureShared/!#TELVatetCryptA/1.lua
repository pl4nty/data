-- Threat: !InfrastructureShared
-- Name: !#TEL:VatetCrypt.A
-- Type: 12

local l_0_0 = mp.getfilesize()
if 1280 < l_0_0 or l_0_0 < 48 then
  return mp.CLEAN
end
local l_0_1 = {
  252,
  232,
  nil,
  0,
  0,
  0
}
local l_0_2 = #l_0_1
local l_0_3 = mp.bitxor(headerpage[1], l_0_1[1])
for l_0_4 = 2, l_0_2 do
  local l_0_5 = headerpage[l_0_4]
  local l_0_6 = l_0_3
  if l_0_1[l_0_4] ~= nil then
    l_0_6 = mp.bitxor(l_0_5, l_0_1[l_0_4])
  end
  if l_0_6 ~= l_0_3 then
    return mp.CLEAN
  else
    l_0_3 = l_0_6
  end
end
local l_0_7 = l_0_3
local l_0_8 = {"\""}
for l_0_9 = 1, l_0_0 do
  table.insert(l_0_8, "%" .. string.format("%02X", (mp.bitxor(headerpage[l_0_9], l_0_7))))
end
table.insert(l_0_8, "\"")
local l_0_10 = table.concat(l_0_8)
mp.vfo_add_buffer(l_0_10, "[Vatet_Crypt_v1]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
