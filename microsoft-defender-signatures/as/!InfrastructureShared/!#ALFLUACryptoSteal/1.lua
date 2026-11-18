-- Threat: !InfrastructureShared
-- Name: !#ALF:LUA:CryptoSteal
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & (//SCPT:HTML/Crypto | //SCPT:HTML/Wallet)

local l_0_0 = 0
local l_0_1 = "//SCPT:HTML/DoubleCryptoFraudKey"
for l_0_2 = 1, 30 do
  local l_0_3 = l_0_1 .. l_0_2
  if mp.get_mpattribute(l_0_3) then
    l_0_0 = l_0_0 + 1
  end
end
if 1 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
