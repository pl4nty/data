-- Threat: !InfrastructureShared
-- Name: !#TEL:Ransom:Linux/KryptinaBuilder.DK
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (BM_SH_FILE | Lua:SHExt | BM_TEXT_FILE | BM_PY_FILE | Lua:PYExt | Lua:JSONExt | Lua:JSONExt | Lua:TXTExt)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 51200 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:KryptinaRansomCfg_")
if 10 <= #l_0_1 then
  return mp.INFECTED
end
local l_0_2 = mp.enum_mpattributesubstring("SCPT:KryptinaRansom_3")
if 7 <= #l_0_1 and 0 < #l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
