-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousMSILfilename
-- Type: 10
-- MpAttributes: Lua:EXEExt & pea_ismsil

local l_0_0 = string.lower(mp.getfilename())
local l_0_1 = {
  "payment proof"
}
for l_0_2 = 1, #l_0_1 do
  if string.find(l_0_0, l_0_1[l_0_2], 1, true) ~= nil then
    mp.set_mpattribute("Lua:SuspiciousMSILfilename")
    return mp.LOWFI
  end
end
local l_0_3 = {
  "payment.proof",
  "booking.+confirmation"
}
for l_0_4 = 1, #l_0_3 do
  if string.find(l_0_0, l_0_3[l_0_4]) ~= nil then
    mp.set_mpattribute("Lua:SuspiciousMSILfilename")
    return mp.LOWFI
  end
end
return mp.CLEAN
