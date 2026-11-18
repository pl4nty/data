-- Threat: !InfrastructureShared
-- Name: !#Lua:IntentXoredFile
-- Type: 10
-- MpAttributes: HSTR:SuspDriverImports

local l_0_0 = 256
local l_0_1 = tostring(pesecs[3].Name)
if l_0_1 ~= ".data" then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(pesecs[3].PointerToRawData, l_0_0)
mp.readprotection(true)
for l_0_3 = 1, l_0_0, 8 do
  local l_0_4 = mp.readu_u32(l_0_2, l_0_3)
  local l_0_5 = mp.readu_u32(l_0_2, l_0_3 + 4)
  local l_0_6 = mp.bitxor(l_0_4, l_0_5)
  if l_0_6 == 9460302 and l_0_4 ~= 10115661 then
    return mp.INFECTED
  end
end
return mp.CLEAN
