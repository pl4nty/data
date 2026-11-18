-- Threat: \xd8\xa1Coinminer.C13
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (BM_PY_FILE | Lua:PYExt)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Miner_")
if l_0_0 ~= nil and 4 < #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
